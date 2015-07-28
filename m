From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:50 -0300
Subject: [Buildroot] [PATCH 109/113] cwiid: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-109-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cwiid/cwiid.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/cwiid/cwiid.hash

diff --git a/package/cwiid/cwiid.hash b/package/cwiid/cwiid.hash
new file mode 100644
index 0000000..749c9c3
--- /dev/null
+++ b/package/cwiid/cwiid.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	8880378303d872ea65b037184ad6c96bc68f87764b503c152032f56344b5e81d	cwiid-0.6.00.tgz
-- 
2.3.6
