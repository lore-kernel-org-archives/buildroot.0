From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 18:10:51 +0100
Subject: [Buildroot] Anybody with a Cubieboard2 ?
Message-ID: <20151228181051.48601453@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

If we have some users with a Cubieboard2, it would be really good if
one of you could update the defconfig we have for the Cubieboard2,
especially the version of U-Boot being used.

The current version of U-Boot being used doesn't build properly for
highly parallel builds, and therefore causes some build failures in our
Travis continuous integration.

If you have a Cubieboard2 and don't know how to help, just let me know,
I can probably update the configuration, and give you the new images to
be tested.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
