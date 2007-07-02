From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Tue, 3 Jul 2007 00:03:18 +0700
Subject: [Buildroot] Patch for busybox config file name
Message-ID: <5d75f4610707021003s4b1def1dh1dc5c59158c4a4c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For revision 18994 I needed this patch:

--- buildroot/package/busybox/Config.in 2007-07-02 23:59:49.000000000 +0700
+++ buildroot.new/package/busybox/Config.in     2007-07-02
23:51:10.000000000 +0700
@@ -100,6 +100,7 @@
        default "package/busybox/busybox-1.5.0.config" if
BR2_BUSYBOX_VERSION_1_5_0
        default "package/busybox/busybox-1.5.0.config" if
BR2_BUSYBOX_VERSION_1_5_1
        default "package/busybox/busybox-1.6.0.config" if
BR2_BUSYBOX_VERSION_1_6_0
+       default "package/busybox/busybox-1.6.1.config" if
BR2_BUSYBOX_VERSION_1_6_1
        help
          Some people may wish to use their own modified BusyBox configuration
          file, and will specify their config file location with this option.
