// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LogisticsManager {
    // ========================
    // State Variables
    // ========================
    address public owner; // Address of the contract owner
    mapping(address => bool) public isAuthorizedUpdater; // Authorized updaters mapping

    // Struct for package details
    struct Package {
        string details;
        string currentStatus;
        address lastModifiedBy;
    }

    mapping(uint256 => Package) public packages; // Mapping of package ID to package details

    // ========================
    // Events
    // ========================
    event PackageStatusModified(
        uint256 indexed packageId,
        string newStatus,
        address indexed modifiedBy
    );

    event UpdaterRoleToggled(address indexed updater, bool isGranted);

    // ========================
    // Modifiers
    // ========================
    modifier onlyOwner() {
        require(msg.sender == owner, "Access restricted to owner only");
        _;
    }

    modifier onlyAuthorizedUpdater() {
        require(isAuthorizedUpdater[msg.sender], "Access restricted to updaters only");
        _;
    }

    // ========================
    // Constructor
    // ========================
    constructor() {
        owner = msg.sender;
    }

    // ========================
    // Owner-Only Functions
    // ========================

    /// @notice Grants updater role to an address
    /// @param updater Address to be granted the updater role
    function grantUpdaterRole(address updater) external onlyOwner {
        isAuthorizedUpdater[updater] = true;
        emit UpdaterRoleToggled(updater, true);
    }

    /// @notice Revokes updater role from an address
    /// @param updater Address to be revoked the updater role
    function revokeUpdaterRole(address updater) external onlyOwner {
        isAuthorizedUpdater[updater] = false;
        emit UpdaterRoleToggled(updater, false);
    }

    // ========================
    // Updater-Only Functions
    // ========================

    /// @notice Updates the status and details of a package
    /// @param packageId ID of the package
    /// @param details Description of the package
    /// @param newStatus New status of the package
    function modifyPackageStatus(
        uint256 packageId,
        string memory details,
        string memory newStatus
    ) public onlyAuthorizedUpdater {
        packages[packageId] = Package({
            details: details,
            currentStatus: newStatus,
            lastModifiedBy: msg.sender
        });

        emit PackageStatusModified(packageId, newStatus, msg.sender);
    }

    // ========================
    // Public View Functions
    // ========================

    /// @notice Retrieves details of a package
    /// @param packageId ID of the package
    /// @return details Package description
    /// @return currentStatus Current status of the package
    /// @return lastModifiedBy Address of the last updater
    function viewPackageDetails(uint256 packageId)
        public
        view
        returns (
            string memory details,
            string memory currentStatus,
            address lastModifiedBy
        )
    {
        Package memory packageInfo = packages[packageId];
        return (packageInfo.details, packageInfo.currentStatus, packageInfo.lastModifiedBy);
    }
}
