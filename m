From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 14:53:30 +0100
Subject: [Buildroot] [git commit] package/postgresql: add
 POSTGRESQL_CPE_ID_VENDOR
Message-ID: <20210117133641.D4E60815C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7161012000304456e796d97d063bbb413080b386
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:postgresql:postgresql is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apostgresql%3Apostgresql

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/postgresql/postgresql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 98361c00c8..31c83d64c7 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -9,6 +9,7 @@ POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
 POSTGRESQL_LICENSE_FILES = COPYRIGHT
+POSTGRESQL_CPE_ID_VENDOR = postgresql
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = \
