**SupplyChain: A Blockchain-Based Shipment Tracking System**
This smart contract, built on Ethereum, provides a secure and decentralized solution for tracking goods as they move through different stages in a supply chain.

**Overview**
**The SupplyChain contract enables users to:**
- Track Goods: Define and monitor the status of shipments.
- Role-Based Control: Only authorized entities can update shipment statuses.
- Retrieve Details: View shipment information anytime.
- Transparency: Emit events for every status update or role change.

**Features**
**Role-Based Access Control:**
- Admin: The deployer of the contract becomes the admin by default.
- Updater: Admin can assign or revoke updater roles using addUpdater and removeUpdater.

**Shipment Monitoring:**
- Shipment Mapping: Shipments are tracked with unique IDs.
- Secure Updates: Only authorized updaters can change shipment statuses.

**Event Logging:**
- ShipmentStatusUpdated: Logs all shipment status changes.
- UpdaterRoleChanged: Tracks role modifications for updaters.

**User-Friendly Functions:**
- getShipment: Allows anyone to view shipment details.
- Admin Controls: Admin can manage updaters efficiently.

**Getting Started**

1. Clone the repository:
   ```bash
   https://github.com/Izleeve/goods_track.git
   ```
2. Deploy the contract using your preferred Ethereum development environment (e.g., Remix, Truffle).

3. Interact with the contract:
   Admin Actions:
   - Add updaters: addUpdater
   - Remove updaters: removeUpdater
   Updater Actions:
   - Update shipment: updateShipmentStatus
   General Actions:
   - View shipment: getShipment
