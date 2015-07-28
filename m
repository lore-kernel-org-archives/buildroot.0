From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:21 -0300
Subject: [Buildroot] [PATCH 020/113] iotop: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-20-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iotop/iotop.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/iotop/iotop.hash

diff --git a/package/iotop/iotop.hash b/package/iotop/iotop.hash
new file mode 100644
index 0000000..b2c497c
--- /dev/null
+++ b/package/iotop/iotop.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	1a7c02fd3758bb048d8af861c5f8735eb3ee9abadeaa787f27b8af2b1eaee8ce	iotop-0.6.tar.gz
-- 
2.3.6
