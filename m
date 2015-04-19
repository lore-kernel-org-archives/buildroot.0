From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 19:53:12 +0200
Subject: [Buildroot] [PATCH 09/10] package/metacity: add hash
In-Reply-To: <1429465993-30357-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429465993-30357-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429465993-30357-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/metacity/metacity.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/metacity/metacity.hash

diff --git a/package/metacity/metacity.hash b/package/metacity/metacity.hash
new file mode 100644
index 0000000..4945016
--- /dev/null
+++ b/package/metacity/metacity.hash
@@ -0,0 +1,2 @@
+# From http://ftp.gnome.org/pub/gnome/sources/metacity/2.25/metacity-2.25.1.sha256sum
+sha256	fb2ede4ac02d7da08d3c3323fb76afaf945c8cccc07cb2d3a4b7f44fb49f1c47	metacity-2.25.1.tar.bz2
-- 
1.7.10.4
