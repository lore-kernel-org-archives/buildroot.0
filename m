From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 15:12:43 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/pugixml: add
 _CPE_ID_VENDOR
Message-ID: <20210426125913.40446817A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5e0da8f042860e4cc87e9e28bfd6781bd23d04b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:pugixml_project:pugixml:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:pugixml_project:pugixml

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
[yann.morin.1998 at free.fr: move up, right after license]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 12e88b0d602cc709279053dd93608597a8948fdc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pugixml/pugixml.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 5d7fc63017..ddda5a3ccc 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -8,6 +8,8 @@ PUGIXML_VERSION = 1.11.4
 PUGIXML_SITE = http://github.com/zeux/pugixml/releases/download/v$(PUGIXML_VERSION)
 PUGIXML_LICENSE = MIT
 PUGIXML_LICENSE_FILES = LICENSE.md
+PUGIXML_CPE_ID_VENDOR = pugixml_project
+
 PUGIXML_INSTALL_STAGING = YES
 
 # Pugixml will automatically enable 'long long' support on C++11 compilers,
