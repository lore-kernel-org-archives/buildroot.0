From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 20:24:39 -0300
Subject: [Buildroot] [PATCH 3/4] crda: add hash file
In-Reply-To: <1413329080-25292-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413329080-25292-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413329080-25292-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/crda/crda.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/crda/crda.hash

diff --git a/package/crda/crda.hash b/package/crda/crda.hash
new file mode 100644
index 0000000..2fc04e6
--- /dev/null
+++ b/package/crda/crda.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/software/network/crda/sha256sums.asc
+sha256	2f85da7ab0170b140d6ed62596c8f268d4a7dedecf84cac7182ada979742ff59	crda-3.13.tar.xz
-- 
2.0.4
