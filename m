From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 19:23:11 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/postgresql:
 security bump version to 13.3
Message-ID: <20210514165532.2BCFF87507@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdedf7c984fec8ca165405025ca5ce49cb25afbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes CVE-2021-32027, CVE-2021-32028 & CVE-2021-32029:
https://www.postgresql.org/about/news/postgresql-133-127-1112-1017-and-9622-released-2210/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b544587806d9a17f0b27335bbb1a1b4ca347bc5a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 7dfe194837..caa8a1f5e7 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,5 +1,5 @@
-# From https://ftp.postgresql.org/pub/source/v13.2/postgresql-13.2.tar.bz2.sha256
-sha256  5fd7fcd08db86f5b2aed28fcfaf9ae0aca8e9428561ac547764c2a2b0f41adfc  postgresql-13.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v13.3/postgresql-13.3.tar.bz2.sha256
+sha256  3cd9454fa8c7a6255b6743b767700925ead1b9ab0d7a0f9dcb1151010f8eb4a1  postgresql-13.3.tar.bz2
 
 # License file, Locally calculated
 sha256  31ccadc0a70e8e0e8a35c5833567b64388dfe34987d962e1911554e271294105  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 9206c62462..cab5553805 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 13.2
+POSTGRESQL_VERSION = 13.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
