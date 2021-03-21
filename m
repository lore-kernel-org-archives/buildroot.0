From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 21 Mar 2021 21:58:06 +0100
Subject: [Buildroot] [PATCH v1] package/tzdata: bump version to 2021a
Message-ID: <20210321205806.9643-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://mm.icann.org/pipermail/tz-announce/2021-January/000065.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-- 
2.30.2
