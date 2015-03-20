From: Mike Williams <mike@mikebwilliams.com>
Date: Fri, 20 Mar 2015 15:13:51 -0400
Subject: [Buildroot] systemd cleanups v2
Message-ID: <1426878856-15747-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes:
v1 -> v2:
* numerous packages adjusted to put udev rules in /usr/lib instead of /lib
* use relative symlinks everywhere
* avahi: AVAHI_EXTRA_CFLAGS -> AVAHI_CFLAGS
* OpenSSH: enable by linking to multi-user.target.wants in /etc instead of /usr/lib
* systemd: create dir /etc/systemd/system/getty.target.wants
* thttpd: add systemd support, fix line wraps from separate v1 patch
* gpsd: fix systemd and udev support
* lighttpd: use upstream service file
* wpa_supplicant: rolled into series from separate patch
