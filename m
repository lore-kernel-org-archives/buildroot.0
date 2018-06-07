From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  7 Jun 2018 20:03:27 +0200
Subject: [Buildroot] [PATCH 1/1] adding-packages-cargo.txt: remove
 host-cargo select
Message-ID: <20180607180327.12308-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove select BR2_PACKAGE_HOST_CARGO from Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 docs/manual/adding-packages-cargo.txt | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index b7fc09acfe..8ef8fc08f4 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -18,11 +18,10 @@ The +Config.in+ file of Cargo-based package 'foo' should contain:
 01: config BR2_PACKAGE_FOO
 02: 	bool "foo"
 03: 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
-04: 	select BR2_PACKAGE_HOST_CARGO
-05: 	help
-06: 	  This is a comment that explains what foo is.
-07:
-08: 	  http://foosoftware.org/foo/
+04: 	help
+05: 	  This is a comment that explains what foo is.
+06:
+07: 	  http://foosoftware.org/foo/
 ---------------------------
 
 ==== Cargo-based package's +.mk+ file
-- 
2.14.1
