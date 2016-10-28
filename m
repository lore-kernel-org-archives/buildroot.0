From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 14:44:14 +0200
Subject: [Buildroot] [git commit] package/postgresql: indentation cleanup
Message-ID: <20161028124448.C90B87FCA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32f5f465905499875c8ea9e536c842bd2f657c78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/postgresql/postgresql.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 1b184e7..8290370 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -11,9 +11,10 @@ POSTGRESQL_LICENSE = PostgreSQL
 POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
-POSTGRESQL_CONF_ENV = ac_cv_type_struct_sockaddr_in6=yes \
-		      pgac_cv_snprintf_long_long_int_modifier="%lld" \
-		      pgac_cv_snprintf_size_t_support=yes
+POSTGRESQL_CONF_ENV = \
+	ac_cv_type_struct_sockaddr_in6=yes \
+	pgac_cv_snprintf_long_long_int_modifier="%lld" \
+	pgac_cv_snprintf_size_t_support=yes
 POSTGRESQL_CONF_OPTS = --disable-rpath
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
