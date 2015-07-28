From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:11 -0300
Subject: [Buildroot] [PATCH 010/113] flot: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/flot/flot.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/flot/flot.hash

diff --git a/package/flot/flot.hash b/package/flot/flot.hash
new file mode 100644
index 0000000..9bf348a
--- /dev/null
+++ b/package/flot/flot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952	flot-0.8.3.tar.gz
-- 
2.3.6
