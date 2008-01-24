From: b93049 <b93049@csie.ntu.edu.tw>
Date: Thu, 24 Jan 2008 11:57:27 +0800
Subject: [Buildroot] buildroot make kernel
Message-ID: <20080124035727.M33801@csie.ntu.edu.tw>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, U have a question about buildroot producing arm board kernel.
I have assign the location about my kernel config file
(make menuconfig -> kernel -> .config file).
But buildroot still want me give it some config information.
(
 *
* General setup
*
Local version - append to kernel release (LOCALVERSION) []
Automatically append version information to the version string
(LOCALVERSION_AUTO) [Y/n/?] y
Support for paging of anonymous memory (swap) (SWAP) [Y/n/?] y
System V IPC (SYSVIPC) [Y/n/?] y
  IPC Namespaces (IPC_NS) [N/y/?] (NEW) POSIX Message Queues (POSIX_MQUEUE)
[N/y/?] n
BSD Process Accounting (BSD_PROCESS_ACCT) [N/y/?] n
Export task/process statistics through netlink (EXPERIMENTAL) (TASKSTATS)
[N/y/?] n
UTS Namespaces (UTS_NS) [N/y/?] (NEW) Auditing support (AUDIT) [N/y/?] n
Kernel .config support (IKCONFIG) [Y/n/?] y
  Enable access to .config through /proc/config.gz (IKCONFIG_PROC) [Y/n/?] y
Kernel log buffer size (16 => 64KB, 17 => 128KB) (LOG_BUF_SHIFT) [14] 14
Create deprecated sysfs files (SYSFS_DEPRECATED) [Y/n/?] (NEW) Kernel->user
space relay support (formerly relayfs) (RELAY) [N/y/?] n
Initial RAM filesystem and RAM disk (initramfs/initrd) support
(BLK_DEV_INITRD) [Y/n/?] y
  Initramfs source file(s) (INITRAMFS_SOURCE) []
Optimize for size (Look out for broken compilers!) (CC_OPTIMIZE_FOR_SIZE)
[Y/n/?] y
.........
)
Am I taking error steps ??


--
Open WebMail Project (http://openwebmail.org)
