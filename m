From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Jan 2021 21:38:47 +0100
Subject: [Buildroot] [git commit] package/go: add GO_CPE_ID_VENDOR
Message-ID: <20210111202014.E7709870BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4eefdbed0632b30423c9d6421479f85ba3d40fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

golang is the correct CPE ID vendor for the go package, see:
https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agolang%3Ago

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index e9f8be7783..e65b24364f 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -10,6 +10,7 @@ GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
 GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
+GO_CPE_ID_VENDOR = golang
 
 HOST_GO_DEPENDENCIES = host-go-bootstrap
 HOST_GO_GOPATH = $(HOST_DIR)/usr/share/go-path
