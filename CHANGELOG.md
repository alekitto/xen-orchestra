# ChangeLog

## **5.76.2** (2022-11-14)

<img id="latest" src="https://badgen.net/badge/channel/latest/yellow" alt="Channel: latest" />

### Bug fixes

- [Proxies] Fix `this.getObject is not a function` on upgrade

### Released packages

- xo-server 5.106.1

## **5.76.1** (2022-11-08)

### Enhancements

- [API] `proxy.register` accepts `vmUuid` parameter which can be used when not connected to the XAPI containing the XO Proxy VM
- [Proxy] Can now upgrade proxies in VMs not connected to XO
- [REST API] Expose VM snapshots and templates
- [REST API] Expose VDI snapshots
- [Select license] Display product type in the options (PR [#6512](https://github.com/vatesfr/xen-orchestra/pull/6512))

### Bug fixes

- [Pool] Add tooltip on "no XCP-ng Pro support" warning icon (PR [#6505](https://github.com/vatesfr/xen-orchestra/pull/6505))
- [Backup] Respect HTTP proxy setting when connecting to XCP-ng/XenServer pools
- [Dashboard/Health] Fix `an error has occurred` in case of unknown default SR (PR [#6508](https://github.com/vatesfr/xen-orchestra/pull/6508))
- [Backup] Really disable Healthcheck when unchecking settings [#6501](https://github.com/vatesfr/xen-orchestra/issues/6501) (PR [#6515](https://github.com/vatesfr/xen-orchestra/pull/6515))
- [Pool] Improve XCP-ng Pro Support tooltips wording [Forum#6535](https://xcp-ng.org/forum/topic/6535) (PR [#6517](https://github.com/vatesfr/xen-orchestra/pull/6517))

### Released packages

- xo-server 5.106.0
- xo-web 5.107.0

## **5.76.0** (2022-10-31)

### Enhancements

- [Backup/Encryption] Use `aes-256-gcm` instead of `aes-256-ccm` to mitigate [padding oracle attacks](https://en.wikipedia.org/wiki/Padding_oracle_attack) (PR [#6447](https://github.com/vatesfr/xen-orchestra/pull/6447))
- [Settings/Remote] Display `lock` icon for encrypted remote and a warning if the remote uses a legacy encryption algorithm (PR [#6465](https://github.com/vatesfr/xen-orchestra/pull/6465))
- `xo-server`'s logs can now be sent to an external Syslog server
- [Delta Backup] Use [NBD](https://en.wikipedia.org/wiki/Network_block_device) to download disks (PR [#6461](https://github.com/vatesfr/xen-orchestra/pull/6461))
- [License] Possibility to bind XCP-ng license to hosts at pool level (PR [#6453](https://github.com/vatesfr/xen-orchestra/pull/6453))
- [New VM] Ability to destroy the cloud configuration disk after the first boot [#6438](https://github.com/vatesfr/xen-orchestra/issues/6438) (PR [#6486](https://github.com/vatesfr/xen-orchestra/pull/6486))

### Bug fixes

- Really enable by default the embedded HTTP/HTTPS proxy
- [Licenses] Remove "Bind license" button for proxies whose corresponding VM cannot be found (PR [#6472](https://github.com/vatesfr/xen-orchestra/pull/6472))

### Released packages

- @xen-orchestra/log 0.4.0
- @vates/disposable 0.1.2
- @vates/nbd-client 1.0.0
- @vates/otp 1.0.0
- @vates/predicates 1.1.0
- @vates/read-chunk 1.0.1
- @xen-orchestra/audit-core 0.2.1
- @xen-orchestra/backups 0.29.0
- @xen-orchestra/fs 3.2.0
- @xen-orchestra/mixins 0.8.1
- @xen-orchestra/xapi 1.5.2
- @xen-orchestra/proxy 0.26.4
- vhd-cli 0.9.2
- vhd-lib 4.1.1
- xo-remote-parser 0.9.2
- xo-server 5.105.0
- xo-server-audit 0.10.1
- xo-server-auth-ldap 0.10.5
- xo-server-backup-reports 0.17.1
- xo-server-load-balancer 0.7.1
- xo-server-netbox 0.3.4
- xo-server-sdn-controller 1.0.6
- xo-server-transport-nagios 0.1.2
- xo-server-usage-report 0.10.1
- xo-server-web-hooks 0.3.1
- xo-web 5.106.0

## **5.75.0** (2022-09-30)

<img id="stable" src="https://badgen.net/badge/channel/stable/green" alt="Channel: stable" />

### Enhancements

- [Backup/Restore file] Implement File level restore for s3 and encrypted backups (PR [#6409](https://github.com/vatesfr/xen-orchestra/pull/6409))
- [Backup] Improve listing speed by updating caches instead of regenerating them on backup creation/deletion (PR [#6411](https://github.com/vatesfr/xen-orchestra/pull/6411))
- [Backup] Add `mergeBlockConcurrency` and `writeBlockConcurrency` to allow tuning of backup resources consumptions (PR [#6416](https://github.com/vatesfr/xen-orchestra/pull/6416))
- [Sync hook] VM can now be notified before being snapshot, please [see the documentation](https://github.com/vatesfr/xen-orchestra/blob/master/@xen-orchestra/xapi/docs/vm-sync-hook.md) (PR [#6423](https://github.com/vatesfr/xen-orchestra/pull/6423))
- [Storage/NFS] Ability to use subdirectory when creating new NFS storage [#3919](https://github.com/vatesfr/xen-orchestra/issues/3919) (PR [#6425](https://github.com/vatesfr/xen-orchestra/pull/6425))

### Bug fixes

- [Plugin/auth-saml] Certificate input support multiline (PR [#6403](https://github.com/vatesfr/xen-orchestra/pull/6403))
- [Backup] Launch Health Check after a full backup (PR [#6401](https://github.com/vatesfr/xen-orchestra/pull/6401))
- [Backup] Fix `Lock file is already being held` error when deleting a VM backup while the VM is currently being backed up
- [Tasks] Fix the pool filter that did not display tasks even if they existed (PR [#6424](https://github.com/vatesfr/xen-orchestra/pull/6424))
- [Tasks] Fix tasks being displayed for all users (PR [#6422](https://github.com/vatesfr/xen-orchestra/pull/6422))
- [Storage/advanced] Fix the display of VDI to coalesce [#6334](https://xcp-ng.org/forum/topic/6334/coalesce-not-showing-anymore) (PR [#6429](https://github.com/vatesfr/xen-orchestra/pull/6429))
- [Backup] Ignore disabled remotes instead of failing the execution [#6347](https://github.com/vatesfr/xen-orchestra/issues/6374) (PR [#6430](https://github.com/vatesfr/xen-orchestra/pull/6430))
- [Home/VMs] Fix VMs being deleted despite clicking on Cancel in the bulk deletion modal (PR [#6435](https://github.com/vatesfr/xen-orchestra/pull/6435))

### Released packages

- vhd-lib 4.1.0
- @vates/fuse-vhd 1.0.0
- @xen-orchestra/xapi 1.5.0
- @xen-orchestra/backups 0.28.0
- @xen-orchestra/backups-cli 0.7.8
- @xen-orchestra/proxy 0.26.2
- xo-server 5.103.1
- xo-server-auth-saml 0.10.1
- xo-web 5.104.0

## **5.74.3** (2022-09-09)

### Bug fixes

- [Start VM] Clearer error message when `NO_HOSTS_AVAILABLE` error is triggered [#6316](https://github.com/vatesfr/xen-orchestra/issues/6316) (PR [#6408](https://github.com/vatesfr/xen-orchestra/pull/6408))
- [OVA Import] Fix `invalid parameters` error

### Released packages

- xo-server 5.102.3

## **5.74.2** (2022-09-06)

### Bug fixes

- [Host] Fix some missing pools and errors in SRs list when HA is used (PR [#6404](https://github.com/vatesfr/xen-orchestra/pull/6404))

### Released packages

- xo-server 5.102.1

## **5.74.1** (2022-09-03)

### Enhancements

- [Dashboard/Health] Detect broken VHD chains and display missing parent VDIs (PR [#6356](https://github.com/vatesfr/xen-orchestra/pull/6356))
- [Proxy] Ability to bind a licence to an existing proxy (PR [#6348](https://github.com/vatesfr/xen-orchestra/pull/6348))
- [Backup] Implement encryption for backup files on storage (PR [#6321](https://github.com/vatesfr/xen-orchestra/pull/6321))
- [VM/Console] Don't connect if the [console is disabled](https://support.citrix.com/article/CTX217766/how-to-disable-the-console-for-the-vm-in-xencenter) [#6319](https://github.com/vatesfr/xen-orchestra/issues/6319)

### Released packages

- @xen-orchestra/fs 3.1.0
- vhd-lib 4.0.1
- @xen-orchestra/mixins 0.8.0
- @xen-orchestra/proxy 0.26.1
- xo-server 5.102.0
- xo-web 5.103.0

## **5.74.0** (2022-08-31)

### Enhancements

- [Home/Storage] Show which SRs are used for HA state files [#6339](https://github.com/vatesfr/xen-orchestra/issues/6339) (PR [#6384](https://github.com/vatesfr/xen-orchestra/pull/6384))

### Bug fixes

- [Backup/Restore] Fix backup list not loading on page load (PR [#6364](https://github.com/vatesfr/xen-orchestra/pull/6364))
- [Host] Fix `should not contains property ["ignoreBackup"]` on some host operations (PR [#6362](https://github.com/vatesfr/xen-orchestra/pull/6362))

### Released packages

- @xen-orchestra/fs 3.0.0
- vhd-lib 4.0.0
- @xen-orchestra/backups 0.27.4
- @xen-orchestra/backups-cli 0.7.7
- @xen-orchestra/xapi 1.4.2
- xen-api 1.2.2
- @xen-orchestra/proxy 0.26.0
- vhd-cli 0.9.1
- xo-vmdk-to-vhd 2.4.3
- xo-server 5.101.0
- xo-web 5.102.0

## **5.73.1** (2022-08-04)

### Bug fixes

- [Backup] Fix `incorrect backup size in metadata` on each merged VHD (PR [#6331](https://github.com/vatesfr/xen-orchestra/pull/6331))
- [Backup] Fix `assertionError [ERR_ASSERTION]: Expected values to be strictly equal` when resuming a merge (PR [#6349](https://github.com/vatesfr/xen-orchestra/pull/6349))

### Released packages

- @xen-orchestra/backups 0.27.3
- @xen-orchestra/fs 2.1.0
- @xen-orchestra/mixins 0.7.1
- @xen-orchestra/proxy 0.25.1
- vhd-cli 0.9.0
- vhd-lib 3.3.5
- xo-server 5.100.1
- xo-server-auth-saml 0.10.0
- xo-web 5.101.1

## **5.73.0** (2022-07-29)

### Highlights

- [REST API] VDI import now also supports the raw format
- HTTPS server can acquire SSL certificate from Let's Encrypt (PR [#6320](https://github.com/vatesfr/xen-orchestra/pull/6320))

### Enhancements

- Embedded HTTP/HTTPS proxy is now enabled by default
- [VM] Display a confirmation modal when stopping/restarting a protected VM (PR [#6295](https://github.com/vatesfr/xen-orchestra/pull/6295))

### Bug fixes

- [Home/VM] Show error when deleting VMs failed (PR [#6323](https://github.com/vatesfr/xen-orchestra/pull/6323))
- [REST API] Fix broken VDI after VHD import [#6327](https://github.com/vatesfr/xen-orchestra/issues/6327) (PR [#6326](https://github.com/vatesfr/xen-orchestra/pull/6326))
- [Netbox] Fix `ipaddr: the address has neither IPv6 nor IPv4 format` error (PR [#6328](https://github.com/vatesfr/xen-orchestra/pull/6328))

### Released packages

- @vates/async-each 1.0.0
- @xen-orchestra/fs 2.0.0
- @xen-orchestra/backups 0.27.2
- @xen-orchestra/backups-cli 0.7.6
- @xen-orchestra/mixins 0.7.0
- @xen-orchestra/xapi 1.4.1
- @xen-orchestra/proxy 0.25.0
- vhd-cli 0.8.1
- vhd-lib 3.3.4
- xo-cli 0.14.1
- xo-server 5.100.0
- xo-web 5.101.0

## **5.72.1** (2022-07-11)

### Enhancements

- [SR] When SR is in maintenance, add "Maintenance mode" badge next to its name (PR [#6313](https://github.com/vatesfr/xen-orchestra/pull/6313))

### Bug fixes

- [Tasks] Fix tasks not displayed when running CR backup job [Forum#6038](https://xcp-ng.org/forum/topic/6038/not-seeing-tasks-any-more-as-admin) (PR [#6315](https://github.com/vatesfr/xen-orchestra/pull/6315))
- [Backup] Fix failing merge multiple VHDs at once (PR [#6317](https://github.com/vatesfr/xen-orchestra/pull/6317))
- [VM/Console] Fix _Connect with SSH/RDP_ when address is IPv6
- [Audit] Ignore side-effects free API methods `xoa.check`, `xoa.clearCheckCache` and `xoa.getHVSupportedVersions`

### Released packages

- @xen-orchestra/backups 0.27.0
- @xen-orchestra/backups-cli 0.7.5
- @xen-orchestra/proxy 0.23.5
- vhd-lib 3.3.2
- xo-server 5.98.1
- xo-server-audit 0.10.0
- xo-web 5.100.0

## **5.72.0** (2022-06-30)

### Highlights

- [Backup] Merge delta backups without copying data when using VHD directories on NFS/SMB/local remote(https://github.com/vatesfr/xen-orchestra/pull/6271))
- [Proxies] Ability to copy the proxy access URL (PR [#6287](https://github.com/vatesfr/xen-orchestra/pull/6287))
- [SR/Advanced] Ability to enable/disable _Maintenance Mode_ [#6215](https://github.com/vatesfr/xen-orchestra/issues/6215) (PRs [#6308](https://github.com/vatesfr/xen-orchestra/pull/6308), [#6297](https://github.com/vatesfr/xen-orchestra/pull/6297))
- [User] User tokens management through XO interface (PR [#6276](https://github.com/vatesfr/xen-orchestra/pull/6276))
- [Tasks, VM/General] Self Service users: show tasks related to their pools, hosts, SRs, networks and VMs (PR [#6217](https://github.com/vatesfr/xen-orchestra/pull/6217))

### Enhancements

- [Backup/Restore] Clearer error message when importing a VM backup requires XCP-n/CH >= 8.1 (PR [#6304](https://github.com/vatesfr/xen-orchestra/pull/6304))
- [Backup] Users can use VHD directory on any remote type (PR [#6273](https://github.com/vatesfr/xen-orchestra/pull/6273))

### Bug fixes

- [VDI Import] Fix `this._getOrWaitObject is not a function`
- [VM] Attempting to delete a protected VM should display a modal with the error and the ability to bypass it (PR [#6290](https://github.com/vatesfr/xen-orchestra/pull/6290))
- [OVA Import] Fix import stuck after first disk
- [File restore] Ignore symbolic links

### Released packages

- @vates/event-listeners-manager 1.0.1
- @vates/read-chunk 1.0.0
- @xen-orchestra/backups 0.26.0
- @xen-orchestra/backups-cli 0.7.4
- xo-remote-parser 0.9.1
- @xen-orchestra/fs 1.1.0
- @xen-orchestra/openflow 0.1.2
- @xen-orchestra/xapi 1.4.0
- @xen-orchestra/proxy 0.23.4
- @xen-orchestra/proxy-cli 0.3.1
- vhd-lib 3.3.1
- vhd-cli 0.8.0
- xo-vmdk-to-vhd 2.4.2
- xo-server 5.98.0
- xo-web 5.99.0

## **5.71.1 (2022-06-13)**

### Enhancements

- Show raw errors to administrators instead of _unknown error from the peer_ (PR [#6260](https://github.com/vatesfr/xen-orchestra/pull/6260))

### Bug fixes

- [New SR] Fix `method.startsWith is not a function` when creating an _ext_ SR
- Import VDI content now works when there is a HTTP proxy between XO and the host (PR [#6261](https://github.com/vatesfr/xen-orchestra/pull/6261))
- [Backup] Fix `undefined is not iterable (cannot read property Symbol(Symbol.iterator))` on XS 7.0.0
- [Backup] Ensure a warning is shown if a target preparation step fails (PR [#6266](https://github.com/vatesfr/xen-orchestra/pull/6266))
- [OVA Export] Avoid creating a zombie task (PR [#6267](https://github.com/vatesfr/xen-orchestra/pull/6267))
- [OVA Export] Increase speed by lowering compression to acceptable level (PR [#6267](https://github.com/vatesfr/xen-orchestra/pull/6267))
- [OVA Export] Fix broken OVAs due to special characters in VM name (PR [#6267](https://github.com/vatesfr/xen-orchestra/pull/6267))

### Released packages

- @xen-orchestra/backups 0.25.0
- @xen-orchestra/backups-cli 0.7.3
- xen-api 1.2.1
- @xen-orchestra/xapi 1.2.0
- @xen-orchestra/proxy 0.23.2
- @xen-orchestra/proxy-cli 0.3.0
- xo-cli 0.14.0
- xo-vmdk-to-vhd 2.4.1
- xo-server 5.96.0
- xo-web 5.97.2

## **5.71.0 (2022-05-31)**

### Highlights

- [Backup] _Restore Health Check_ can now be configured to be run automatically during a backup schedule (PRs [#6227](https://github.com/vatesfr/xen-orchestra/pull/6227), [#6228](https://github.com/vatesfr/xen-orchestra/pull/6228), [#6238](https://github.com/vatesfr/xen-orchestra/pull/6238) & [#6242](https://github.com/vatesfr/xen-orchestra/pull/6242))
- [Backup] VMs with USB Pass-through devices are now supported! The advanced _Offline Snapshot Mode_ setting must be enabled. For Full Backup or Disaster Recovery jobs, Rolling Snapshot needs to be anabled as well. (PR [#6239](https://github.com/vatesfr/xen-orchestra/pull/6239))
- [Backup] Implement file cache for listing the backups of a VM (PR [#6220](https://github.com/vatesfr/xen-orchestra/pull/6220))
- [RPU/Host] If some backup jobs are running on the pool, ask for confirmation before starting an RPU, shutdown/rebooting a host or restarting a host's toolstack (PR [6232](https://github.com/vatesfr/xen-orchestra/pull/6232))
- [XO Web] Add ability to configure a default filter for Storage [#6236](https://github.com/vatesfr/xen-orchestra/issues/6236) (PR [#6237](https://github.com/vatesfr/xen-orchestra/pull/6237))
- [REST API] Support VDI creation via VHD import

### Enhancements

- [Backup] Merge multiple VHDs at once which will speed up the merging phase after reducing the retention of a backup job(PR [#6184](https://github.com/vatesfr/xen-orchestra/pull/6184))
- [Backup] Add setting `backups.metadata.defaultSettings.unconditionalSnapshot` in `xo-server`'s configuration file to force a snapshot even when not required by the backup, this is useful to avoid locking the VM halted during the backup (PR [#6221](https://github.com/vatesfr/xen-orchestra/pull/6221))
- [VM migration] Ensure the VM can be migrated before performing the migration to avoid issues [#5301](https://github.com/vatesfr/xen-orchestra/issues/5301) (PR [#6245](https://github.com/vatesfr/xen-orchestra/pull/6245))
- [Backup] Show any detected errors on existing backups instead of fixing them silently (PR [#6207](https://github.com/vatesfr/xen-orchestra/pull/6225))
- Created SRs will now have auto-scan enabled similarly to what XenCenter does (PR [#6246](https://github.com/vatesfr/xen-orchestra/pull/6246))
- [RPU] Disable scheduled backup jobs during RPU (PR [#6244](https://github.com/vatesfr/xen-orchestra/pull/6244))

### Bug fixes

- [S3] Fix S3 remote with empty directory not showing anything to restore (PR [#6218](https://github.com/vatesfr/xen-orchestra/pull/6218))
- [S3] remote fom did not save the `https` and `allow unatuhorized`during remote creation (PR [#6219](https://github.com/vatesfr/xen-orchestra/pull/6219))
- [VM/advanced] Fix various errors when adding ACLs [#6213](https://github.com/vatesfr/xen-orchestra/issues/6213) (PR [#6230](https://github.com/vatesfr/xen-orchestra/pull/6230))
- [Home/Self] Don't make VM's resource set name clickable for non admin users as they aren't allowed to view the Self Service page (PR [#6252](https://github.com/vatesfr/xen-orchestra/pull/6252))
- [load-balancer] Fix density mode failing to shutdown hosts (PR [#6253](https://github.com/vatesfr/xen-orchestra/pull/6253))
- [Health] Make "Too many snapshots" table sortable by number of snapshots (PR [#6255](https://github.com/vatesfr/xen-orchestra/pull/6255))
- [Remote] Show complete errors instead of only a potentially missing message (PR [#6216](https://github.com/vatesfr/xen-orchestra/pull/6216))

### Released packages

- @xen-orchestra/self-signed 0.1.3
- vhd-lib 3.2.0
- @xen-orchestra/fs 1.0.3
- vhd-cli 0.7.2
- xo-vmdk-to-vhd 2.4.0
- @xen-orchestra/upload-ova 0.1.5
- @xen-orchestra/xapi 1.1.0
- @xen-orchestra/backups 0.24.0
- @xen-orchestra/backups-cli 0.7.2
- @xen-orchestra/emit-async 1.0.0
- @xen-orchestra/mixins 0.5.0
- @xen-orchestra/proxy 0.23.1
- xo-server 5.95.0
- xo-web 5.97.1
- xo-server-backup-reports 0.17.0

## 5.70.2 (2022-05-16)

### Bug fixes

- [Pool/Patches] Fix failure to install patches on Citrix Hypervisor (PR [#6231](https://github.com/vatesfr/xen-orchestra/pull/6231))

### Released packages

- @xen-orchestra/xapi 1.0.0
- @xen-orchestra/backups 0.23.0
- @xen-orchestra/mixins 0.4.0
- @xen-orchestra/proxy 0.22.1
- xo-server 5.93.1

## 5.70.1 (2022-05-04)

### Enhancement

- [Backup] Support `[NOBAK]` VDI prefix for all backup modes [#2560](https://github.com/vatesfr/xen-orchestra/issues/2560) (PR [#6207](https://github.com/vatesfr/xen-orchestra/pull/6207))
- [VM/Host Console] Fix fallback for older versions of XCP-ng/XS (PR [#6203](https://github.com/vatesfr/xen-orchestra/pull/6203))

### Bug fixes

- [Backup Health Check] Fix guest tools detection (PR [#6214](https://github.com/vatesfr/xen-orchestra/pull/6214))

### Released packages

- @xen-orchestra/mixins 0.3.1
- @xen-orchestra/xapi 0.11.0
- @xen-orchestra/backups 0.22.0
- @xen-orchestra/proxy 0.22.0
- xo-server 5.93.0

## 5.70.0 (2022-04-29)

### Highlights

- [VM export] Feat export to `ova` format (PR [#6006](https://github.com/vatesfr/xen-orchestra/pull/6006))
- [Backup] Add _Restore Health Check_: ensure a backup is viable by doing an automatic test restore (requires guest tools in the VM) (PR [#6148](https://github.com/vatesfr/xen-orchestra/pull/6148))
- [Import] Feat import `iso` disks (PR [#6180](https://github.com/vatesfr/xen-orchestra/pull/6180))
- New HTTP/HTTPS proxy implemented in xo-proxy and xo-server, [see the documentation](https://github.com/vatesfr/xen-orchestra/blob/master/@xen-orchestra/mixins/docs/HttpProxy.md) (PR [#6201](https://github.com/vatesfr/xen-orchestra/pull/6201))
- [Backup job] Cache DNS queries (PR [#6196](https://github.com/vatesfr/xen-orchestra/pull/6196))

### Enhancements

- [VM migrate] Allow to choose a private network for VIFs network (PR [#6200](https://github.com/vatesfr/xen-orchestra/pull/6200))
- [Proxy] Disable "Deploy proxy" button for source users (PR [#6199](https://github.com/vatesfr/xen-orchestra/pull/6199))

### Bug fixes

- [VM/Host Console] Fix support of older versions of XCP-ng/XS, please not that HTTP proxies are note supported in that case (PR [#6191](https://github.com/vatesfr/xen-orchestra/pull/6191))
- Fix HTTP proxy support to connect to pools (introduced in XO 5.69.0) (PR [#6204](https://github.com/vatesfr/xen-orchestra/pull/6204))
- [Backup] Fix failure when sending a backup (Full/Delta/Metadata) to S3 with Object Lock enabled (PR [#6190](https://github.com/vatesfr/xen-orchestra/pull/6190))

### Released packages

- @vates/cached-dns.lookup 1.0.0
- @vates/event-listeners-manager 1.0.0
- xen-api 1.2.0
- @xen-orchestra/mixins 0.3.0
- xo-vmdk-to-vhd 2.3.0
- @xen-orchestra/fs 1.0.1
- @xen-orchestra/backups 0.21.1
- @xen-orchestra/proxy 0.21.0
- xo-server 5.92.0
- xo-web 5.96.0
- vhd-cli 0.7.1
- @xen-orchestra/backups-cli 0.7.1

## **5.69.2** (2022-04-13)

### Enhancements

- [Rolling Pool Update] New algorithm for XCP-ng updates (PR [#6188](https://github.com/vatesfr/xen-orchestra/pull/6188))

### Bug fixes

- [Plugins] Automatically configure plugins when a configuration file is imported (PR [#6171](https://github.com/vatesfr/xen-orchestra/pull/6171))
- [VMDK Export] Fix `VBOX_E_FILE_ERROR (0x80BB0004)` when importing in VirtualBox (PR [#6163](https://github.com/vatesfr/xen-orchestra/pull/6163))
- [Backup] Fix "Cannot read properties of undefined" error when restoring from a proxied remote (PR [#6179](https://github.com/vatesfr/xen-orchestra/pull/6179))
- [Rolling Pool Update] Fix "cannot read properties of undefined" error [#6170](https://github.com/vatesfr/xen-orchestra/issues/6170) (PR [#6186](https://github.com/vatesfr/xen-orchestra/pull/6186))

### Released packages

- xen-api 1.1.0
- xo-vmdk-to-vhd 2.2.0
- @xen-orchestra/proxy 0.20.1
- xo-server 5.90.2

## **5.69.1** (2022-03-31)

### Bug fixes

- [Backup] Fix `plan enterprise is not defined in the PLANS object` (PR [#6168](https://github.com/vatesfr/xen-orchestra/pull/6168))

### Released packages

- xo-server 5.90.2

## **5.69.0** (2022-03-31)

### Highlights

- [REST API] Expose networks, VBDs, VDIs and VIFs
- [Console] Supports host and VM consoles behind HTTP proxies [#6133](https://github.com/vatesfr/xen-orchestra/pull/6133)
- [Install patches] Disable patch installation when `High Availability` is enabled (PR [#6145](https://github.com/vatesfr/xen-orchestra/pull/6145))
- [Delta Backup/Restore] Ability to ignore some VDIs (PR [#6143](https://github.com/vatesfr/xen-orchestra/pull/6143))
- [Import VM] Ability to import a VM from a URL (PR [#6130](https://github.com/vatesfr/xen-orchestra/pull/6130))

### Enhancements

- [Rolling Pool Update] Don't update if some of the hosts are not running
- [VM form] Add link to documentation on secure boot in the Advanced tab (PR [#6146](https://github.com/vatesfr/xen-orchestra/pull/6146))
- [Install patches] Update confirmation messages for patch installation (PR [#6159](https://github.com/vatesfr/xen-orchestra/pull/6159))

### Bug fixes

- [Rolling Pool Update] Don't fail if `load-balancer` plugin is missing (Starter and Enterprise plans)
- [Backup/Restore] Fix missing backups on Backblaze
- [Templates] Fix "incorrect state" error when trying to delete a default template [#6124](https://github.com/vatesfr/xen-orchestra/issues/6124) (PR [#6119](https://github.com/vatesfr/xen-orchestra/pull/6119))
- [New SR] Fix "SR_BACKEND_FAILURE_103" error when selecting "No selected value" for the path [#5991](https://github.com/vatesfr/xen-orchestra/issues/5991) (PR [#6137](https://github.com/vatesfr/xen-orchestra/pull/6137))
- [Jobs] Fix "invalid parameters" error when running jobs in some cases (PR [#6156](https://github.com/vatesfr/xen-orchestra/pull/6156))
- [New SR] Take NFS version and options into account when creating an ISO SR
- Allow a decimal when displaying small values (e.g. show _1.4 TiB_ instead of _1 TiB_ for 1,400 GiB of RAM)

### Released packages

- xo-common 0.8.0
- @vates/decorate-with 2.0.0
- xen-api 1.0.0
- @xen-orchestra/xapi 0.10.0
- @xen-orchestra/fs 1.0.0
- vhd-cli 0.7.0
- @xen-orchestra/backups 0.21.0
- @xen-orchestra/proxy 0.20.0
- xo-server 5.90.1
- xo-web 5.95.0

## **5.68.0** (2022-02-28)

### Highlights

- [New SR] Add confirmation message before creating local SR (PR [#6121](https://github.com/vatesfr/xen-orchestra/pull/6121))
- [Dashboad/Health] List all VDIs that need coalescing (PR [#6120](https://github.com/vatesfr/xen-orchestra/pull/6120))
- [Delta Backup/Restore] Ability to choose SR for each VDI [#4605](https://github.com/vatesfr/xen-orchestra/issues/4605), [#4016](https://github.com/vatesfr/xen-orchestra/issues/4016) (PR [#6117](https://github.com/vatesfr/xen-orchestra/pull/6117))

### Enhancements

- [Menu] Show a warning icon when some SRs have more than 10 VDIs to coalesce (PR [#6120](https://github.com/vatesfr/xen-orchestra/pull/6120))

### Bug fixes

- [Self service] Change identifiers used for VM templates to avoid them from being removed on XCP-ng upgrade
- [Proxy] Always connect to XAPI via [backup network if defined](https://xen-orchestra.com/blog/xen-orchestra-5-64/#backupmigrationnetwork)
- [Backup/File restore] Do not list backups on non-compatible remotes (S3) (PR [#6116](https://github.com/vatesfr/xen-orchestra/pull/6116))

### Released packages

- xen-api 0.36.0
- @xen-orchestra/xapi 0.9.0
- @vates/predicates 1.0.0
- @xen-orchestra/mixins 0.2.0
- @xen-orchestra/backups 0.20.0
- @xen-orchestra/proxy 0.19.0
- xo-cli 0.13.0
- xo-server 5.89.0
- xo-server-audit 0.9.3
- xo-web 5.94.0

## **5.67.0** (2022-01-31)

### Highlights

- [Rolling Pool Update] Automatically pause load balancer plugin during the update [#5711](https://github.com/vatesfr/xen-orchestra/issues/5711)
- [Export/Disks] Allow the export of disks in VMDK format (PR [#5982](https://github.com/vatesfr/xen-orchestra/pull/5982))
- Limit number of concurrent VM migrations per pool to `3`. Can be changed in `xo-server`'s configuration file: `xapiOptions.vmMigrationConcurrency` [#6065](https://github.com/vatesfr/xen-orchestra/issues/6065) (PR [#6076](https://github.com/vatesfr/xen-orchestra/pull/6076))
- [Health] Display pools with no default SR (PR [#6083](https://github.com/vatesfr/xen-orchestra/pull/6083))
- [Backup] Speedup merge and cleanup speed for S3 backup by a factor 10 (PR [#6100](https://github.com/vatesfr/xen-orchestra/pull/6100))
- [Proxy] Now ships a reverse proxy (PR [#6072](https://github.com/vatesfr/xen-orchestra/pull/6072))

### Enhancements

- [Delta Backup] When using S3 remote, retry uploading VHD parts on Internal Error to support [Blackblaze](https://www.backblaze.com/b2/docs/calling.html#error_handling) [Forum#5397](https://xcp-ng.org/forum/topic/5397/delta-backups-failing-aws-s3-uploadpartcopy-cpu-too-busy/5) (PR [#6086](https://github.com/vatesfr/xen-orchestra/issues/6086))
- [Backup] Add sanity check of aliases on S3 remotes (PR [#6043](https://github.com/vatesfr/xen-orchestra/pull/6043))

### Bug fixes

- [Backup] Detect and clear orphan merge states, fix `ENOENT` errors (PR [#6087](https://github.com/vatesfr/xen-orchestra/pull/6087))
- [Backup] Ensure merges are also executed after backup on S3, maintaining the size of the VHD chain under control [Forum#45743](https://xcp-ng.org/forum/post/45743) (PR [#6095](https://github.com/vatesfr/xen-orchestra/pull/6095))
- [Backup] Delete backups immediately instead of waiting for the next backup (PR [#6081](https://github.com/vatesfr/xen-orchestra/pull/6081))
- [Backup] Delete S3 backups completely, even if there are more than 1000 files (PR [#6103](https://github.com/vatesfr/xen-orchestra/pull/6103))
- [Backup] Fix merge resuming (PR [#6099](https://github.com/vatesfr/xen-orchestra/pull/6099))
- [Plugin/Audit] Fix `key cannot be 'null' or 'undefined'` error when no audit log in the database [#6040](https://github.com/vatesfr/xen-orchestra/issues/6040) (PR [#6071](https://github.com/vatesfr/xen-orchestra/pull/6071))
- [Backup] Fix backuping restored VMs
- [Audit Log] Don't log `proxy.getApplianceUpdaterState` API calls
- [Audit Log] Fix long data loading when displaying logs (PR [#6113](https://github.com/vatesfr/xen-orchestra/pull/6113))

### Released packages

- @xen-orchestra/fs 0.20.0
- vhd-lib 3.1.0
- @xen-orchestra/backups 0.19.0
- @xen-orchestra/backups-cli 0.7.0
- xo-vmdk-to-vhd 2.1.0
- @xen-orchestra/proxy 0.18.0
- xo-server-audit 0.9.2
- xo-server 5.87.0
- xo-web 5.92.0
