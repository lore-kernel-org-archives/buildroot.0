From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jun 2014 01:22:07 +0200
Subject: [Buildroot] make graph-depends
In-Reply-To: <CAE9DZUQ+sAwbrSqeK9cQk9DGshwA2AojBoaFiqKAG4LdJTh9RA@mail.gmail.com>
References: <CAE9DZUQ+sAwbrSqeK9cQk9DGshwA2AojBoaFiqKAG4LdJTh9RA@mail.gmail.com>
Message-ID: <20140612232207.GC3502@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dallas, All,

On 2014-06-12 18:19 -0500, Dallas Clement spake thusly:
> I tried this out for the first time today.  Things did not so so well.
> 
> $ make graph-depends
> /bin/sh: line 3: dot: command not found

This is the error.

See the manual:
    http://buildroot.net/downloads/manual/manual.html#_graphing_the_dependencies_between_packages

    ---8<---
    Note that the dependency graphs are generated using the dot tool
    from the Graphviz project, which you must have installed on your
    system to use this feature. In most distributions, it is available
    as the graphviz package.
    ---8<---

Regards,
Yann E. MORIN.

> Getting targets
> Getting dependencies for ['host-autoconf', 'host-automake', 'host-expat',
> 'host-libtool', 'host-lzo', 'host-m4', 'host-mtd', 'host-pkgconf',
> 'host-zlib', 'host-bison', 'host-fakeroot', 'host-file', 'host-flex',
> 'host-icu', 'host-kmod', 'host-lzop', 'host-makedevs', 'host-mysql',
> 'host-ncurses', 'host-nkf', 'host-python', 'host-uboot-tools',
> 'toolchain-external', 'toolchain', 'LPRng', 'alsa-lib', 'apt', 'bash',
> 'berkeleydb', 'bridge-utils', 'age', 'at-onebyone', 'buffalo-info',
> 'crypt-key-gen', 'delusraxs', 'dwarf', 'failover-failback',
> 'libfseventmon', 'libomronups', 'libondemandsync', 'lprmd',
> 'ls_sonar_lsprcvd', 'mail-notification', 'nas_apps', 'nas_configgen_splx',
> 'nas-feature-utils', 'nvram-uboot', 'onlineupdate', 'rep-jobdaemon',
> 'rsfwd', 'SimpleShutdown', 'SleepTimer', 'sqliteman', 'tmail', 'TSUpdater',
> 'u-boot-image', 'wbfs', 'webaxs', 'busybox', 'bzip2', 'coreutils', 'cpio',
> 'cracklib', 'daemonize', 'dhcpcd', 'dosfstools', 'dpkg', 'e2fsprogs',
> 'eaccelerator', 'elfutils', 'epeg', 'ethtool', 'expat', 'ffmpeg', 'file',
> 'findutils', 'fio', 'flex', 'flickcurl', 'freetype', 'gd', 'gdbm', 'gmp',
> 'gphoto2', 'gptfdisk', 'grep', 'gzip', 'hdparm', 'htop', 'hyperestraier',
> 'icu', 'imagemagick', 'inotify-tools', 'iostat', 'iperf', 'iptables',
> 'jpeg', 'jsonrpc2', 'kerberos', 'kmod', 'less', 'libcurl', 'libelf',
> 'libexif', 'libffi', 'libfuse', 'libgcrypt', 'libgpg-error', 'libgphoto2',
> 'libid3tag', 'libjpeg', 'libjson', 'libmcrypt', 'libmhash', 'libnet',
> 'libnl', 'liboauth', 'libol', 'libpcap', 'libtirpc', 'libtool',
> 'libusb-compat', 'libusb', 'libxml2', 'libxslt', 'lighttpd', 'linux-pam',
> 'lldpd', 'logrotate', 'lsof', 'lvm2', 'lzo', 'lzop', 'mDNSResponder',
> 'makedevs', 'mcrypt', 'mdadm', 'memstat', 'memtester', 'minicom',
> 'mt-daapd', 'mtd', 'mysql', 'ncurses', 'neon', 'netatalk', 'netcat',
> 'netsnmp', 'nfs-utils', 'nkf', 'ntfs-3g', 'ntp', 'ntpclient', 'nut',
> 'openldap', 'openssh', 'openssl', 'pam_smb', 'parted', 'pciutils', 'pcre',
> 'perf', 'perl', 'php', 'phpMyAdmin', 'pkgconf', 'popt', 'pppd',
> 'pptp-linux', 'procps-ng', 'proftpd', 'psmisc', 'python', 'qdbm',
> 'readline', 'rp-pppoe', 'rpcbind', 'rsync', 'samba', 'sdparm', 'sg3_utils',
> 'shadow', 'smartmontools', 'sqlite', 'ssmtp', 'strace', 'sysklogd',
> 'sysstat', 't1lib', 'tar', 'tcpdump', 'tree', 'tzcodedata', 'uboot-tools',
> 'unfs3', 'unzip', 'usbutils', 'util-linux', 'uucp', 'ufsd', 'config-shell',
> 'lio-utils', 'rtsadmin', 'rtslib', 'rts-target', 'surveillance-server',
> 'tmnas', 'bittorrent', 'chimera', 'twonky', 'vfs-recycleplus', 'vim',
> 'wget', 'which', 'xerces', 'xfsprogs', 'xz', 'zlib', 'linux', 'rootfs-tar']
> Getting dependencies for ['ocf-linux', 'libpng', 'fuse', 'host-e2fsprogs']
> Removing redundant dep all -> host-autoconf
> Removing redundant dep all -> host-automake
> Removing redundant dep all -> host-expat
> Removing redundant dep all -> host-libtool
> Removing redundant dep all -> host-lzo
> Removing redundant dep all -> host-m4
> Removing redundant dep all -> host-mtd
> Removing redundant dep all -> host-pkgconf
> Removing redundant dep all -> host-zlib
> Removing redundant dep all -> host-autoconf
> Removing redundant dep all -> host-automake
> Removing redundant dep all -> host-bison
> Removing redundant dep all -> host-fakeroot
> Removing redundant dep all -> host-file
> Removing redundant dep all -> host-flex
> Removing redundant dep all -> host-icu
> Removing redundant dep all -> host-kmod
> Removing redundant dep all -> host-libtool
> Removing redundant dep all -> host-lzop
> Removing redundant dep all -> host-makedevs
> Removing redundant dep all -> host-mysql
> Removing redundant dep all -> host-ncurses
> Removing redundant dep all -> host-nkf
> Removing redundant dep all -> host-pkgconf
> Removing redundant dep all -> host-python
> Removing redundant dep all -> host-uboot-tools
> Removing redundant dep all -> toolchain-external
> Removing redundant dep all -> berkeleydb
> Removing redundant dep all -> libomronups
> Removing redundant dep all -> busybox
> Removing redundant dep all -> bzip2
> Removing redundant dep all -> e2fsprogs
> Removing redundant dep all -> elfutils
> Removing redundant dep all -> expat
> Removing redundant dep all -> file
> Removing redundant dep all -> flex
> Removing redundant dep all -> flickcurl
> Removing redundant dep all -> freetype
> Removing redundant dep all -> gd
> Removing redundant dep all -> gdbm
> Removing redundant dep all -> icu
> Removing redundant dep all -> jpeg
> Removing redundant dep all -> kerberos
> Removing redundant dep all -> libcurl
> Removing redundant dep all -> libffi
> Removing redundant dep all -> libfuse
> Removing redundant dep all -> libgcrypt
> Removing redundant dep all -> libgpg-error
> Removing redundant dep all -> libgphoto2
> Removing redundant dep all -> libid3tag
> Removing redundant dep all -> libjson
> Removing redundant dep all -> libmcrypt
> Removing redundant dep all -> libmhash
> Removing redundant dep all -> liboauth
> Removing redundant dep all -> libpcap
> Removing redundant dep all -> libtirpc
> Removing redundant dep all -> libtool
> Removing redundant dep all -> libusb-compat
> Removing redundant dep all -> libusb
> Removing redundant dep all -> libxml2
> Removing redundant dep all -> libxslt
> Removing redundant dep all -> linux-pam
> Removing redundant dep all -> lvm2
> Removing redundant dep all -> lzo
> Removing redundant dep all -> mtd
> Removing redundant dep all -> mysql
> Removing redundant dep all -> ncurses
> Removing redundant dep all -> netsnmp
> Removing redundant dep all -> openldap
> Removing redundant dep all -> openssl
> Removing redundant dep all -> pcre
> Removing redundant dep all -> php
> Removing redundant dep all -> popt
> Removing redundant dep all -> pppd
> Removing redundant dep all -> python
> Removing redundant dep all -> qdbm
> Removing redundant dep all -> readline
> Removing redundant dep all -> samba
> Removing redundant dep all -> sqlite
> Removing redundant dep all -> util-linux
> Removing redundant dep all -> rts-target
> Removing redundant dep all -> xerces
> Removing redundant dep all -> xfsprogs
> Removing redundant dep all -> xz
> Removing redundant dep all -> zlib
> Removing redundant dep all -> linux
> Removing redundant dep LPRng -> toolchain
> Removing redundant dep alsa-lib -> toolchain
> Removing redundant dep apt -> toolchain
> Removing redundant dep bash -> toolchain
> Removing redundant dep berkeleydb -> toolchain
> Removing redundant dep bridge-utils -> toolchain
> Removing redundant dep age -> toolchain
> Removing redundant dep at-onebyone -> toolchain
> Removing redundant dep buffalo-info -> toolchain
> Removing redundant dep crypt-key-gen -> toolchain
> Removing redundant dep delusraxs -> toolchain
> Removing redundant dep dwarf -> toolchain
> Removing redundant dep failover-failback -> toolchain
> Removing redundant dep libfseventmon -> toolchain
> Removing redundant dep libomronups -> toolchain
> Removing redundant dep libondemandsync -> toolchain
> Removing redundant dep lprmd -> toolchain
> Removing redundant dep ls_sonar_lsprcvd -> toolchain
> Removing redundant dep mail-notification -> toolchain
> Removing redundant dep nas_apps -> toolchain
> Removing redundant dep nas_configgen_splx -> toolchain
> Removing redundant dep nas-feature-utils -> toolchain
> Removing redundant dep nvram-uboot -> toolchain
> Removing redundant dep onlineupdate -> toolchain
> Removing redundant dep rep-jobdaemon -> toolchain
> Removing redundant dep rsfwd -> toolchain
> Removing redundant dep SimpleShutdown -> toolchain
> Removing redundant dep SleepTimer -> toolchain
> Removing redundant dep sqliteman -> toolchain
> Removing redundant dep tmail -> toolchain
> Removing redundant dep TSUpdater -> toolchain
> Removing redundant dep u-boot-image -> toolchain
> Removing redundant dep wbfs -> toolchain
> Removing redundant dep webaxs -> toolchain
> Removing redundant dep busybox -> toolchain
> Removing redundant dep bzip2 -> toolchain
> Removing redundant dep coreutils -> toolchain
> Removing redundant dep cpio -> toolchain
> Removing redundant dep cracklib -> toolchain
> Removing redundant dep daemonize -> toolchain
> Removing redundant dep dhcpcd -> toolchain
> Removing redundant dep dosfstools -> toolchain
> Removing redundant dep dpkg -> toolchain
> Removing redundant dep e2fsprogs -> toolchain
> Removing redundant dep eaccelerator -> toolchain
> Removing redundant dep elfutils -> toolchain
> Removing redundant dep epeg -> toolchain
> Removing redundant dep ethtool -> toolchain
> Removing redundant dep expat -> toolchain
> Removing redundant dep ffmpeg -> toolchain
> Removing redundant dep file -> toolchain
> Removing redundant dep findutils -> toolchain
> Removing redundant dep fio -> toolchain
> Removing redundant dep flex -> toolchain
> Removing redundant dep flickcurl -> toolchain
> Removing redundant dep freetype -> toolchain
> Removing redundant dep gd -> toolchain
> Removing redundant dep gdbm -> toolchain
> Removing redundant dep gmp -> toolchain
> Removing redundant dep gphoto2 -> toolchain
> Removing redundant dep gptfdisk -> toolchain
> Removing redundant dep grep -> toolchain
> Removing redundant dep gzip -> toolchain
> Removing redundant dep hdparm -> toolchain
> Removing redundant dep htop -> toolchain
> Removing redundant dep hyperestraier -> toolchain
> Removing redundant dep icu -> toolchain
> Removing redundant dep imagemagick -> toolchain
> Removing redundant dep inotify-tools -> toolchain
> Removing redundant dep iostat -> toolchain
> Removing redundant dep iperf -> toolchain
> Removing redundant dep iptables -> toolchain
> Removing redundant dep jpeg -> toolchain
> Removing redundant dep jsonrpc2 -> toolchain
> Removing redundant dep kerberos -> toolchain
> Removing redundant dep kmod -> toolchain
> Removing redundant dep less -> toolchain
> Removing redundant dep libcurl -> toolchain
> Removing redundant dep libelf -> toolchain
> Removing redundant dep libexif -> toolchain
> Removing redundant dep libffi -> toolchain
> Removing redundant dep libfuse -> toolchain
> Removing redundant dep libgcrypt -> toolchain
> Removing redundant dep libgpg-error -> toolchain
> Removing redundant dep libgphoto2 -> toolchain
> Removing redundant dep libid3tag -> toolchain
> Removing redundant dep libjpeg -> toolchain
> Removing redundant dep libjson -> toolchain
> Removing redundant dep libmcrypt -> toolchain
> Removing redundant dep libmhash -> toolchain
> Removing redundant dep libnet -> toolchain
> Removing redundant dep libnl -> toolchain
> Removing redundant dep liboauth -> toolchain
> Removing redundant dep libol -> toolchain
> Removing redundant dep libpcap -> toolchain
> Removing redundant dep libtirpc -> toolchain
> Removing redundant dep libtool -> toolchain
> Removing redundant dep libusb-compat -> toolchain
> Removing redundant dep libusb -> toolchain
> Removing redundant dep libxml2 -> toolchain
> Removing redundant dep libxslt -> toolchain
> Removing redundant dep lighttpd -> toolchain
> Removing redundant dep linux-pam -> toolchain
> Removing redundant dep lldpd -> toolchain
> Removing redundant dep logrotate -> toolchain
> Removing redundant dep lsof -> toolchain
> Removing redundant dep lvm2 -> toolchain
> Removing redundant dep lzo -> toolchain
> Removing redundant dep lzop -> toolchain
> Removing redundant dep mDNSResponder -> toolchain
> Removing redundant dep makedevs -> toolchain
> Removing redundant dep mcrypt -> toolchain
> Removing redundant dep mdadm -> toolchain
> Removing redundant dep memstat -> toolchain
> Removing redundant dep memtester -> toolchain
> Removing redundant dep minicom -> toolchain
> Removing redundant dep mt-daapd -> toolchain
> Removing redundant dep mtd -> toolchain
> Removing redundant dep mysql -> toolchain
> Removing redundant dep ncurses -> toolchain
> Removing redundant dep neon -> toolchain
> Removing redundant dep netatalk -> toolchain
> Removing redundant dep netcat -> toolchain
> Removing redundant dep netsnmp -> toolchain
> Removing redundant dep nfs-utils -> toolchain
> Removing redundant dep nkf -> toolchain
> Removing redundant dep ntfs-3g -> toolchain
> Removing redundant dep ntp -> toolchain
> Removing redundant dep ntpclient -> toolchain
> Removing redundant dep nut -> toolchain
> Removing redundant dep openldap -> toolchain
> Removing redundant dep openssh -> toolchain
> Removing redundant dep openssl -> toolchain
> Removing redundant dep pam_smb -> toolchain
> Removing redundant dep parted -> toolchain
> Removing redundant dep pciutils -> toolchain
> Removing redundant dep pcre -> toolchain
> Removing redundant dep perf -> toolchain
> Removing redundant dep perl -> toolchain
> Removing redundant dep php -> toolchain
> Removing redundant dep phpMyAdmin -> toolchain
> Removing redundant dep pkgconf -> toolchain
> Removing redundant dep popt -> toolchain
> Removing redundant dep pppd -> toolchain
> Removing redundant dep pptp-linux -> toolchain
> Removing redundant dep procps-ng -> toolchain
> Removing redundant dep proftpd -> toolchain
> Removing redundant dep psmisc -> toolchain
> Removing redundant dep python -> toolchain
> Removing redundant dep qdbm -> toolchain
> Removing redundant dep readline -> toolchain
> Removing redundant dep rp-pppoe -> toolchain
> Removing redundant dep rpcbind -> toolchain
> Removing redundant dep rsync -> toolchain
> Removing redundant dep samba -> toolchain
> Removing redundant dep sdparm -> toolchain
> Removing redundant dep sg3_utils -> toolchain
> Removing redundant dep shadow -> toolchain
> Removing redundant dep smartmontools -> toolchain
> Removing redundant dep sqlite -> toolchain
> Removing redundant dep ssmtp -> toolchain
> Removing redundant dep strace -> toolchain
> Removing redundant dep sysklogd -> toolchain
> Removing redundant dep sysstat -> toolchain
> Removing redundant dep t1lib -> toolchain
> Removing redundant dep tar -> toolchain
> Removing redundant dep tcpdump -> toolchain
> Removing redundant dep tree -> toolchain
> Removing redundant dep tzcodedata -> toolchain
> Removing redundant dep uboot-tools -> toolchain
> Removing redundant dep unfs3 -> toolchain
> Removing redundant dep unzip -> toolchain
> Removing redundant dep usbutils -> toolchain
> Removing redundant dep util-linux -> toolchain
> Removing redundant dep uucp -> toolchain
> Removing redundant dep ufsd -> toolchain
> Removing redundant dep config-shell -> toolchain
> Removing redundant dep lio-utils -> toolchain
> Removing redundant dep rtsadmin -> toolchain
> Removing redundant dep rtslib -> toolchain
> Removing redundant dep rts-target -> toolchain
> Removing redundant dep surveillance-server -> toolchain
> Removing redundant dep tmnas -> toolchain
> Removing redundant dep bittorrent -> toolchain
> Removing redundant dep chimera -> toolchain
> Removing redundant dep twonky -> toolchain
> Removing redundant dep vfs-recycleplus -> toolchain
> Removing redundant dep vim -> toolchain
> Removing redundant dep wget -> toolchain
> Removing redundant dep which -> toolchain
> Removing redundant dep xerces -> toolchain
> Removing redundant dep xfsprogs -> toolchain
> Removing redundant dep xz -> toolchain
> Removing redundant dep zlib -> toolchain
> Removing redundant dep linux -> toolchain
> Removing redundant dep ocf-linux -> toolchain
> Removing redundant dep libpng -> toolchain
> Removing redundant dep fuse -> toolchain
> Traceback (most recent call last):
>   File
> "/home/dallasc/projects/ts-3000/buildroot/buildroot-2012.08/support/scripts/graph-depends",
> line 252, in <module>
>     print_pkg_deps(0, rootpkg)
>   File
> "/home/dallasc/projects/ts-3000/buildroot/buildroot-2012.08/support/scripts/graph-depends",
> line 246, in print_pkg_deps
>     print_pkg_deps(depth+1, d)
>   File
> "/home/dallasc/projects/ts-3000/buildroot/buildroot-2012.08/support/scripts/graph-depends",
> line 246, in print_pkg_deps
>     print_pkg_deps(depth+1, d)
>   File
> "/home/dallasc/projects/ts-3000/buildroot/buildroot-2012.08/support/scripts/graph-depends",
> line 246, in print_pkg_deps
>     print_pkg_deps(depth+1, d)
>   File
> "/home/dallasc/projects/ts-3000/buildroot/buildroot-2012.08/support/scripts/graph-depends",
> line 245, in print_pkg_deps
>     print "%s -> %s" % (pkg_node_name(pkg), pkg_node_name(d))
> IOError: [Errno 32] Broken pipe
> make: *** [graph-depends] Error 127

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
