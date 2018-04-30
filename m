From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 22:06:26 +0200
Subject: [Buildroot] [PATCH 1/1] libglade: add hash for license file
Message-ID: <20180430200626.8842-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglade/libglade.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libglade/libglade.hash b/package/libglade/libglade.hash
index fdcc837efc..b96c5814b4 100644
--- a/package/libglade/libglade.hash
+++ b/package/libglade/libglade.hash
@@ -1,2 +1,5 @@
 # From http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/libglade-2.6.4.sha256sum
 sha256	64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec	libglade-2.6.4.tar.bz2
+
+# Hash for license file:
+sha256	94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23	COPYING
-- 
2.14.1
