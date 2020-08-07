From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Aug 2020 12:02:34 +0200
Subject: [Buildroot] [git commit branch/next] package/feh: update hash of
 license file
Message-ID: <20200812144328.1120185F4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b14f0e5810153a5d062b5eb82a9c244b3375cffc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In commit 8d8caaf0c295e60fadc0dc14039376bfecb379fa ("package/feh: bump
version to 3.4.1"), feh was bumped from 3.4 to 3.4.1.

However, the hash of the license file was not updated, even though the
COPYING file had seen a copyright year update:

-Copyright (C) 2010-2018 Daniel Friesel.
+Copyright (C) 2010-2020 Daniel Friesel.

Let's update the license file hash to fix legal-info.

Fixes:

  http://autobuild.buildroot.net/results/991fb57bc99c2f44a00c846688f1b3e017b87724/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/feh/feh.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index eea32dbca5..20916af640 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
 sha256 782463034ab0135bc8438515191f986db23a79d502154d23a7c07a7574907b7b  feh-3.4.1.tar.bz2
-sha256 a289176a74d8e5d071456df5d4ee629aeb86f8eeeb6570076fe126f182c6b91d  COPYING
+sha256 2c3a31327dc3cc3331aa6e759d378e4f66d0ece7174a0d5aa137f3cba4bf0509  COPYING
