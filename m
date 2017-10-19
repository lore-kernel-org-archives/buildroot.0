From: Cam Hutchison <camh@xdna.net>
Date: Thu, 19 Oct 2017 22:04:46 +1100
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove package/sepolgen/
Message-ID: <20171019110446.13543-1-camh@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The directory package/sepolgen/ was removed in commit 9d6da7a26
(policycoreutils: split packages and bump to 2.7), but two
entries were left in the DEVELOPERS file.

This causes the following warnings when running util/get-developers:
WARNING: 'package/sepolgen/' doesn't match any file
WARNING: 'package/sepolgen/' doesn't match any file

Remove the erroneous entries.

Signed-off-by: Cam Hutchison <camh@xdna.net>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f913439a2e..7788278518 100644
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
-- 
2.11.0
