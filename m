From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Apr 2021 13:50:08 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/tzdata: bump
 version to 2021a
Message-ID: <20210403112715.05838882A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98fe47d4a2a92548fdf0b7bc56937742628ce0a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

For details see [1].

[1] https://mm.icann.org/pipermail/tz-announce/2021-January/000065.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 01dc8f53418e4b91068e53f1fb99d765fe8b3833)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 6a1ccc128d..f70627481a 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2020-December/000064.html
-sha512  dd312def18c807452fda2e697514e2064c5f51ebdbedd0cfe6f231252c76ee5d4409f653b295ed5657b7d30b868690047fdb70a10942e69eaa40b77473e3f9ca  tzdata2020f.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2021-January/000065.html
+sha512  7cdd762ec90ce12a30fa36b1d66d1ea82d9fa21e514e2b9c7fcbe2541514ee0fadf30843ff352c65512fb270857b51d1517b45e1232b89c6f954ba9ff1833bb3  tzdata2021a.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 8201dc1201..922e7420bc 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2020f
+TZDATA_VERSION = 2021a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_STRIP_COMPONENTS = 0
