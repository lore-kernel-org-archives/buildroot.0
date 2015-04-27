From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Apr 2015 10:02:54 -0300
Subject: [Buildroot] [PATCH 03/16] heimdal: add hash file
In-Reply-To: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
References: <1430139787-19304-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1430139787-19304-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/heimdal/heimdal.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/heimdal/heimdal.hash

diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
new file mode 100644
index 0000000..845e957
--- /dev/null
+++ b/package/heimdal/heimdal.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	aac27bedb33c341b6aed202af07ccc816146a893148721f8123abbbf93bbfea5	heimdal-1.5.3.tar.gz
-- 
2.0.5
