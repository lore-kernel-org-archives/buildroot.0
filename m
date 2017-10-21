From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:37:08 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: remove package/sepolgen/
Message-ID: <20171021083102.B1F3D807D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0122357c1ee2f090de5393e55777c95203f65f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The directory package/sepolgen/ was removed in commit 9d6da7a26
(policycoreutils: split packages and bump to 2.7), but two
entries were left in the DEVELOPERS file.

This causes the following warnings when running util/get-developers:
WARNING: 'package/sepolgen/' doesn't match any file
WARNING: 'package/sepolgen/' doesn't match any file

Remove the erroneous entries.

Signed-off-by: Cam Hutchison <camh@xdna.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f913439..7788278 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -409,7 +409,6 @@ F:	package/libselinux/
 F:	package/libsemanage/
 F:	package/libsepol/
 F:	package/policycoreutils/
-F:	package/sepolgen/
 F:	package/ustr/
 
 N:	Corentin Guillevic <corentin.guillevic@smile.fr>
@@ -1036,7 +1035,6 @@ F:	package/python-posix-ipc/
 F:	package/python-pypcap/
 F:	package/python-pyrex/
 F:	package/raptor/
-F:	package/sepolgen/
 F:	package/setools/
 F:	package/smcroute/
 F:	package/tclap/
