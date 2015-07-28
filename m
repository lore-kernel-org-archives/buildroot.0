From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 15:40:11 -0300
Subject: [Buildroot] [PATCH 070/113] patchelf: add hash file
In-Reply-To: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438108854-11932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1438108854-11932-70-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/patchelf/patchelf.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/patchelf/patchelf.hash

diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
new file mode 100644
index 0000000..0da413e
--- /dev/null
+++ b/package/patchelf/patchelf.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	14af06a2da688d577d64ff8dac065bb8903bbffbe01d30c62df7af9bf4ce72fe	patchelf-0.8.tar.gz
-- 
2.3.6
