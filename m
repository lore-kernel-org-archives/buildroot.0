From: Adam Duskett <aduskett@gmail.com>
Date: Tue,  5 Sep 2017 08:20:10 -0400
Subject: [Buildroot] [PATCH 1/1] postgresql: bump to version 9.6.5
In-Reply-To: <20170905122010.19409-1-aduskett@gmail.com>
References: <20170905122010.19409-1-aduskett@gmail.com>
Message-ID: <20170905122010.19409-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index c65edf71d..62ce9a740 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,2 +1,2 @@
-# From https://ftp.postgresql.org/pub/source/v9.6.3/postgresql-9.6.3.tar.bz2.sha256
-sha256 1645b3736901f6d854e695a937389e68ff2066ce0cde9d73919d6ab7c995b9c6  postgresql-9.6.3.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v9.6.5/postgresql-9.6.5.tar.bz2.sha256
+sha256 06da12a7e3dddeb803962af8309fa06da9d6989f49e22865335f0a14bad0744c  postgresql-9.6.5.tar.bz2
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 62b41cbea..7adb957cf 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.6.3
+POSTGRESQL_VERSION = 9.6.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
-- 
2.13.5
