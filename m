From: Thierry Bultel <tbultel@free.fr>
Date: Fri, 12 Dec 2014 23:38:06 +0100
Subject: [Buildroot] dbus build fails since the bump of systemd to version
	218
Message-ID: <548B6E4E.104@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Since the bump, there are undefined symbols when building dbus-1.8.10:

  CCLD     dbus-daemon
   CCLD     dbus-daemon-launch-helper
/shared/buildroot_community/buildroot/output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/lib/libsystemd.so: 
undefined reference to `__stop_BUS_ERROR_MAP'
/shared/buildroot_community/buildroot/output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/lib/libsystemd.so: 
undefined reference to `__start_BUS_ERROR_MAP'
collect2: error: ld returned 1 exit status
/shared/buildroot_community/buildroot/output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/lib/libsystemd.so: 
undefined reference to `__stop_BUS_ERROR_MAP'
/shared/buildroot_community/buildroot/output/host/usr/i586-buildroot-linux-gnu/sysroot/usr/lib/libsystemd.so: 
undefined reference to `__start_BUS_ERROR_MAP'
collect2: error: ld returned 1 exit status


Regards
Thierry
