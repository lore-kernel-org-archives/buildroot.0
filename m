From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 15:59:22 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: update entry for gcc
Message-ID: <20161015135935.754B381730@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5a3201bf56f2651cf15d33eb3209d2a8c4b2ccb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Refering to package/gcc/gcc-initial and package/gcc/gcc-final was not a
good idea, as it doesn't notify when gcc patches are
added/removed/modified, so change this to package/gcc so that it catches
all changes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e702b2a..c535942 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1451,8 +1451,7 @@ F:	package/cmake/
 F:	package/cramfs/
 F:	package/dmidecode/
 F:	package/flashrom/
-F:	package/gcc/gcc-final/
-F:	package/gcc/gcc-initial/
+F:	package/gcc/
 F:	package/genext2fs/
 F:	package/genromfs/
 F:	package/getent/
