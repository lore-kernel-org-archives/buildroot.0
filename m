From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Tue, 12 Mar 2019 11:00:44 +0000
Subject: [Buildroot] [PATCH 1/1] package/bird: bump to version 2.0.4
Message-ID: <20190312110044.25547-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/bird/bird.hash | 2 +-
 package/bird/bird.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bird/bird.hash b/package/bird/bird.hash
index 3f3a93b964..5e7296c0ab 100644
--- a/package/bird/bird.hash
+++ b/package/bird/bird.hash
@@ -1,2 +1,2 @@
-sha256 0f49b38327d3109553acfa662ac0cf0377719226a03c124cd2e0ea2265ecb1de  bird-2.0.3.tar.gz
+sha256 676010b7517d4159b9af37401c26185f561ffcffeba73690a2ef2fad984714de  bird-2.0.4.tar.gz
 sha256 94c53c84320078920ac1f0d49c81a4e9004512f534521a58bdf145acbcbc2cd2  README
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index da2f868070..e165be61c0 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIRD_VERSION = 2.0.3
+BIRD_VERSION = 2.0.4
 BIRD_SITE = ftp://bird.network.cz/pub/bird
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
-- 
2.19.1
