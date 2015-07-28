From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:45 -0300
Subject: [Buildroot] [PATCH 044/113] libunwind: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-44-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libunwind/libunwind.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/libunwind/libunwind.hash

diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
new file mode 100644
index 0000000..7ec47fa
--- /dev/null
+++ b/package/libunwind/libunwind.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a  libunwind-1.1.tar.gz
-- 
2.3.6
