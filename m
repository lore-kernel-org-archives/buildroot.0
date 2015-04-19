From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:53:10 +0200
Subject: [Buildroot] [PATCH 07/10] package/libglade: add hash
In-Reply-To: <1429465993-30357-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429465993-30357-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429465993-30357-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libglade/libglade.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libglade/libglade.hash

diff --git a/package/libglade/libglade.hash b/package/libglade/libglade.hash
new file mode 100644
index 0000000..fdcc837
--- /dev/null
+++ b/package/libglade/libglade.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/libglade-2.6.4.sha256sum
+sha256	64361e7647839d36ed8336d992fd210d3e8139882269bed47dc4674980165dec	libglade-2.6.4.tar.bz2
-- 
1.7.10.4
