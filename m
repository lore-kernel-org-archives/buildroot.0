From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:39:12 -0300
Subject: [Buildroot] [PATCH 011/113] fmtools: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fmtools/fmtools.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fmtools/fmtools.hash

diff --git a/package/fmtools/fmtools.hash b/package/fmtools/fmtools.hash
new file mode 100644
index 0000000..435cf0a
--- /dev/null
+++ b/package/fmtools/fmtools.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	75174e07d8cde6d4a8a5d7bbaa3a3b0760a850e7f6840cb7c6246227b18f5a39	fmtools-2.0.7.tar.gz
-- 
2.3.6
