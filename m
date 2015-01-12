From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jan 2015 12:36:02 +0100
Subject: [Buildroot] [git commit] postgresql: bump version to 9.4.0
Message-ID: <20150112113706.558788001C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff8832a5b55c186c02998a120de6aa20a8ddd3b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index e53b9dd..6fc9656 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 9.3.5
+POSTGRESQL_VERSION = 9.4.0
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = http://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
