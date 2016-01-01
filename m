From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jan 2016 21:55:17 +0100
Subject: [Buildroot] [git commit] tinyalsa: fix toolchain comment
Message-ID: <20160101205622.693D88010A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a9ac68c9f259eda1a479315a4a37057981ea78b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Documented syntax is '.. needs A toolchain ..'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyalsa/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tinyalsa/Config.in b/package/tinyalsa/Config.in
index 65c5a1a..9ee4767 100644
--- a/package/tinyalsa/Config.in
+++ b/package/tinyalsa/Config.in
@@ -13,5 +13,5 @@ config BR2_PACKAGE_TINYALSA
 
 	  https://github.com/tinyalsa/tinyalsa
 
-comment "tinyalsa needs toolchain w/ dynamic library"
+comment "tinyalsa needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
