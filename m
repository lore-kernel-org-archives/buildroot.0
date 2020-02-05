From: Alistair Francis <alistair.francis@wdc.com>
Date: Wed,  5 Feb 2020 09:33:17 -0800
Subject: [Buildroot] [PATCH] package/xen: Fix COPYING sha256sum
Message-ID: <20200205173317.20745-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The COPYING file was updated between 4.12 and 4.13 as a new paragraph
about the Sphinx documentation being licensed under CC-BY 4.0 was added.
Update the SHA to match the new license.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 package/xen/xen.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 22a6083d9b..ef7c3ba194 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256 c69ae21b2ddeaf25532a81a448fcc6a218bc56f93c8907b2d416b2d4339c0afe xen-4.13.0.tar.gz
-sha256 dba0d79260259c013c52e5d4daeaea564a2fbb9ff7fc6778c377a401ec3898de COPYING
+sha256 36b91794c6d4a678137c70c41e384c03b552c7efba82c0d73e6be842e41ab3d3 COPYING
-- 
2.25.0
