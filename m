From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 18 Mar 2015 11:29:10 -0300
Subject: [Buildroot] [PATCH 1/6] fontconfig: add hash file
Message-ID: <1426688955-23233-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fontconfig/fontconfig.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fontconfig/fontconfig.hash

diff --git a/package/fontconfig/fontconfig.hash b/package/fontconfig/fontconfig.hash
new file mode 100644
index 0000000..e4ec1ac
--- /dev/null
+++ b/package/fontconfig/fontconfig.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/fontconfig/2014-March/005167.html
+sha256	b6b066c7dce3f436fdc0dfbae9d36122b38094f4f53bd8dffd45e195b0540d8d	fontconfig-2.11.1.tar.gz
-- 
2.0.5
