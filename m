From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 May 2018 11:43:54 +0200
Subject: [Buildroot] [git commit] libglade: add hash for license file
Message-ID: <20180501094623.6BA518A556@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73f6bb1eb671cb35c7ad12aeeb2ec4d22a9a62da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
