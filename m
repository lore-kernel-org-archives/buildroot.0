From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:31:02 +0200
Subject: [Buildroot] [git commit] wsapi-xavante: add LICENSE_FILES
Message-ID: <20170906203034.8357882167@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aad1825e93fc1c65ca1d52a57239268457f43fde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wsapi-xavante/wsapi-xavante.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wsapi-xavante/wsapi-xavante.mk b/package/wsapi-xavante/wsapi-xavante.mk
index 937d204..86f5dee 100644
--- a/package/wsapi-xavante/wsapi-xavante.mk
+++ b/package/wsapi-xavante/wsapi-xavante.mk
@@ -8,5 +8,6 @@ WSAPI_XAVANTE_VERSION_MAJOR = 1.6.1
 WSAPI_XAVANTE_VERSION = $(WSAPI_XAVANTE_VERSION_MAJOR)-1
 WSAPI_XAVANTE_SUBDIR = wsapi-$(WSAPI_XAVANTE_VERSION_MAJOR)
 WSAPI_XAVANTE_LICENSE = MIT
+WSAPI_XAVANTE_LICENSE_FILES = $(WSAPI_XAVANTE_SUBDIR)/doc/us/license.html
 
 $(eval $(luarocks-package))
