From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 15:07:24 +0200
Subject: [Buildroot] [PATCH 9/9] package/fftw: add hash
In-Reply-To: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429448844-12598-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429448844-12598-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fftw/fftw.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/fftw/fftw.hash

diff --git a/package/fftw/fftw.hash b/package/fftw/fftw.hash
new file mode 100644
index 0000000..62b8f0f
--- /dev/null
+++ b/package/fftw/fftw.hash
@@ -0,0 +1,2 @@
+# From http://www.fftw.org/fftw-3.3.4.tar.gz.md5sum
+md5	2edab8c06b24feeb3b82bbb3ebf3e7b3	fftw-3.3.4.tar.gz
-- 
1.7.10.4
