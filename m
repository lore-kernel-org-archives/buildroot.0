From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:02 -0300
Subject: [Buildroot] [PATCH 061/113] ndisc6: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-61-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ndisc6/ndisc6.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ndisc6/ndisc6.hash

diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
new file mode 100644
index 0000000..8d71bde
--- /dev/null
+++ b/package/ndisc6/ndisc6.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	6acec8a0cb9efa3ac98456f46c3016aeec0598b0c7557c95242b5228ad62ca7a	ndisc6-1.0.2.tar.bz2
-- 
2.3.6
