From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 09:20:40 +0200
Subject: [Buildroot] systemd improvements V2
Message-ID: <20200615072055.2083-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


-   nss patch redone, now using the template from share/factory,
    and support all 4 plugins from systemd
-   added upstream patch for systemd-tmpfilesd
-   separate RPATH fixup, inlcude all systemd binaries
-   include fix when using an ro filesystem with timesyncd
    (still needs a writable /var/tmp)
-   remove some dbus/util linux subpackage seletion
    (I expect there be discussions)
