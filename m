From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:12 -0300
Subject: [Buildroot] [PATCH 071/113] pax-utils: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-71-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pax-utils/pax-utils.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/pax-utils/pax-utils.hash

diff --git a/package/pax-utils/pax-utils.hash b/package/pax-utils/pax-utils.hash
new file mode 100644
index 0000000..54013c9
--- /dev/null
+++ b/package/pax-utils/pax-utils.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	844ff25b1a11bcef92ef34b22f576f226a772b67196818656f8874513438f5b9	pax-utils-0.8.1.tar.xz
-- 
2.3.6
