From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:26:37 +0100
Subject: [Buildroot] [git commit] libsigsegv: fix patch failure of
	0004-Add-stack...
Message-ID: <20150302222722.DDB8B8177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f522c1e04720d5da3702232a6863d2ccd0e770c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After removing the patch 0001-Add-stack... in commit
9863553fe8fa16a4d19f652b409a44bb58ef5567 "packages: all salute the
passing of avr32" the patch 004-Add-stack... does not apply anymore, so
fix it.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...k-direction-for-the-Blackfin-architecture.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch b/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
index e5f3c49..5d8232a 100644
--- a/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
+++ b/package/libsigsegv/0004-Add-stack-direction-for-the-Blackfin-architecture.patch
@@ -19,7 +19,7 @@ index 53f4216..1a97d5a 100644
 @@ -18,6 +18,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
        arc | \
        arm* | strongarm* | xscale* | \
-       avr | avr32 | \
+       avr | \
 +      bfin | \
        c1 | c2 | c32 | c34 | c38 | \
        clipper | \
