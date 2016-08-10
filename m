From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Aug 2016 15:12:34 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: move existing patch,
	and add to 1.17.4
Message-ID: <20160810131438.329DD8222E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3686101a2ae9ec37b4d34a368db03c325f7f92e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Manuel in bug #9161, the commit
19b503b0d26fa16fffc980c287ca844077f3f675 that bumped the X.org server
from 1.18.3 to 1.18.4 forgot to also rename the patch directory, making
the existing patch orphan, while it is still needed. This commit
therefore renames the 1.18.3 directory to 1.18.4.

Moreover, this patch is also needed for the 1.17.x X.org server series
which has been added recently, so this commit also adds the patch to a
new 1.17.4 directory.

Fixes bug #9161.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{1.18.3 => 1.17.4}/0001-modesettings-needs-dri2.patch                 | 0
 .../{1.18.3 => 1.18.4}/0001-modesettings-needs-dri2.patch                 | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/1.18.3/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.17.4/0001-modesettings-needs-dri2.patch
similarity index 100%
copy from package/x11r7/xserver_xorg-server/1.18.3/0001-modesettings-needs-dri2.patch
copy to package/x11r7/xserver_xorg-server/1.17.4/0001-modesettings-needs-dri2.patch
diff --git a/package/x11r7/xserver_xorg-server/1.18.3/0001-modesettings-needs-dri2.patch b/package/x11r7/xserver_xorg-server/1.18.4/0001-modesettings-needs-dri2.patch
similarity index 100%
rename from package/x11r7/xserver_xorg-server/1.18.3/0001-modesettings-needs-dri2.patch
rename to package/x11r7/xserver_xorg-server/1.18.4/0001-modesettings-needs-dri2.patch
