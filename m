From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:18:04 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/mariadb: add bug
 tracker link to existing patch
Message-ID: <20190930121746.5366E82C0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=828b82b655dd8001a7a83e378263bd5b8b183408
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit db814692d2786bf5fd3dce98e493e3a5d399b0c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/0001-add-extra-check-for-librt.patch | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mariadb/0001-add-extra-check-for-librt.patch b/package/mariadb/0001-add-extra-check-for-librt.patch
index 26bff7546c..90aa626a0b 100644
--- a/package/mariadb/0001-add-extra-check-for-librt.patch
+++ b/package/mariadb/0001-add-extra-check-for-librt.patch
@@ -3,6 +3,8 @@ From: Ryan Coe <bluemrp9@gmail.com>
 Date: Thu, 27 Oct 2016 20:33:21 -0700
 Subject: [PATCH] add extra check for librt
 
+https://jira.mariadb.org/browse/MDEV-10841
+
 Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 ---
  configure.cmake | 3 +++
