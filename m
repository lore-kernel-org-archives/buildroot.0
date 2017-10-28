From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 09:12:01 +0200
Subject: [Buildroot] [git commit] package/zic: bump version to 2017c
Message-ID: <20171028121025.930C37F8AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec176933c282f68b30f3a21f58372ea3e199ae53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zic/zic.hash | 4 ++--
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index 1a68887..e7eef7a 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,2 +1,2 @@
-# From http://mm.icann.org/pipermail/tz-announce/2017-March/000046.html
-sha512 9a73af4b868506d1f6287a8285dea489e68f6828da19509114f9144e2a2019c7fd28f4fb98ea907030d11d011ce3a87d99dbe43bca218beddafff151f0d61df1	tzcode2017b.tar.gz
+# From http://mm.icann.org/pipermail/tz-announce/2017-October/000047.html
+sha512 0d8c3e07b0de9015a137602450468ceb6358312a50eeda2a860882367107b8ba9ef275880b292570a671b9910afc54e6209e1e642387d246bc9c08c4ff660ffb	tzcode2017c.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index 236febf..a2f27e4 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2017b
+ZIC_VERSION = 2017c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = http://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
