From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jul 2009 09:13:44 +0200
Subject: [Buildroot] [git commit] xorg: reorganize the selection of the
	X.org server type
Message-ID: <20090725071547.C7608777D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1956d0f6d640a1acff7ab09be99e890fc202839b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The selection of the X.org server type was really strange. The user
had to select between none, tinyx and modular. Now, the menuconfig
interface display a single item for X.org, that can be
selected/unselected. This entry contains a submenu, that allows to
select the type of the X.org server (tinyX or modular) and that allows
(as before) to enable/disable X.org libraries, drivers, etc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Patch is too large, so refusing to show it
