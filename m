From: =?ISO-8859-15?Q?Andr=E9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 12 Mar 2015 21:07:27 +0100
Subject: [Buildroot] [PATCH] audiofile: Add hash file
Message-ID: <5501F1FF.9080502@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/audiofile/audiofile.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/audiofile/audiofile.hash

diff --git a/package/audiofile/audiofile.hash b/package/audiofile/audiofile.hash
new file mode 100644
index 0000000..3b9cba6
--- /dev/null
+++ b/package/audiofile/audiofile.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	cdc60df19ab08bfe55344395739bb08f50fc15c92da3962fac334d3bff116965  audiofile-0.3.6.tar.gz
-- 
1.9.1
