From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:49 -0300
Subject: [Buildroot] [PATCH 25/27] gperf: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-25-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gperf/gperf.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/gperf/gperf.hash

diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
new file mode 100644
index 0000000..370235c
--- /dev/null
+++ b/package/gperf/gperf.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e	gperf-3.0.4.tar.gz
-- 
2.0.5
