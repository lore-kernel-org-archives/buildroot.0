From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Feb 2021 14:45:33 +0100
Subject: [Buildroot] [git commit] package/atftp: set ATFTP_CPE_ID_VALID
Message-ID: <20210206132523.E9EA97FC0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcfe7db6e6aadcefd8fdc729016c76abea9d6d6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:atftp_project:atftp is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aatftp_project%3Aatftp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/atftp/atftp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/atftp/atftp.mk b/package/atftp/atftp.mk
index 9f9b69a27e..de67a4c680 100644
--- a/package/atftp/atftp.mk
+++ b/package/atftp/atftp.mk
@@ -8,6 +8,7 @@ ATFTP_VERSION = 0.7.4
 ATFTP_SITE = http://sourceforge.net/projects/atftp/files
 ATFTP_LICENSE = GPL-2.0+
 ATFTP_LICENSE_FILES = LICENSE
+ATFTP_CPE_ID_VALID = YES
 ATFTP_CONF_OPTS = --disable-libwrap --disable-mtftp
 # For static we need to explicitly link against libpthread
 ATFTP_LIBS = -lpthread
