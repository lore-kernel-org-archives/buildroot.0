From: Pier Paolo Glave <glave@inwind.it>
Date: Mon, 28 Jul 2008 12:00:18 +0200
Subject: [Buildroot] freetype include files installation
Message-ID: <K4PNSI$B03ECF4679398500773418F4762DE9D1@libero.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've tried building freetype in my environment (mipsel-linux), and I've seen that the latest freetype.mk installs all the header files and the ".a" library onto the target rootfs.
Is there a reason for that?
(Or maybe I'm wrong, since my buildroot tree is not up to date?)

I've tried the revision 20986 of freetype.mk, and it's better for my needs.

Thanks
Pier
