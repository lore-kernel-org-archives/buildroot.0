From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed,  9 May 2007 15:48:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dbus dhcp hal ltt
	netplug nfs-utils port etc...
Message-ID: <20070509224845.8B90648009@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-09 15:48:41 -0700 (Wed, 09 May 2007)
New Revision: 18598

Log:
Rename all INIT scripts to have the numerical prefixes to easily see the start-up order.


Added:
   trunk/buildroot/package/dbus/S97messagebus
   trunk/buildroot/package/dhcp/S80dhcp-relay
   trunk/buildroot/package/dhcp/S80dhcp-server
   trunk/buildroot/package/hal/S98haldaemon
   trunk/buildroot/package/ltt/S27tracer
   trunk/buildroot/package/netplug/S29netplug
   trunk/buildroot/package/nfs-utils/S60nfs
   trunk/buildroot/package/portmap/S13portmap
   trunk/buildroot/package/proftpd/S50proftpd
   trunk/buildroot/package/samba/S91smb
   trunk/buildroot/package/sysklogd/S25syslog
   trunk/buildroot/package/tftpd/S80tftpd-hpa
   trunk/buildroot/package/udev/S10udev

Removed:
   trunk/buildroot/package/dbus/init-dbus
   trunk/buildroot/package/dhcp/init-relay
   trunk/buildroot/package/dhcp/init-server
   trunk/buildroot/package/hal/init-hal
   trunk/buildroot/package/ltt/init-tracer
   trunk/buildroot/package/netplug/init-netplug
   trunk/buildroot/package/nfs-utils/init-nfs
   trunk/buildroot/package/portmap/init-portmap
   trunk/buildroot/package/proftpd/init-proftpd
   trunk/buildroot/package/samba/init-samba
   trunk/buildroot/package/sysklogd/init-syslog
   trunk/buildroot/package/tftpd/init-tftpd
   trunk/buildroot/package/udev/init-udev

Modified:
   trunk/buildroot/package/dbus/dbus.mk
   trunk/buildroot/package/dhcp/dhcp.mk
   trunk/buildroot/package/hal/hal.mk
   trunk/buildroot/package/ltt/ltt.mk
   trunk/buildroot/package/netplug/netplug.mk
   trunk/buildroot/package/nfs-utils/nfs-utils.mk
   trunk/buildroot/package/portmap/portmap.mk
   trunk/buildroot/package/proftpd/proftpd.mk
   trunk/buildroot/package/samba/samba.mk
   trunk/buildroot/package/sysklogd/sysklogd.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/udev/udev.mk


Changeset:

Sorry, the patch is too large to include (2060 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=18598
