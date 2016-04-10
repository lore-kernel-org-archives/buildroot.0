From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 10 Apr 2016 18:59:29 +0200
Subject: [Buildroot] [PATCH 2/3] opentyrian-data: add hash file
In-Reply-To: <1460307570-10914-1-git-send-email-fabio.porcedda@gmail.com>
References: <1460307570-10914-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1460307570-10914-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/opentyrian-data/opentyrian-data.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/opentyrian-data/opentyrian-data.hash

diff --git a/package/opentyrian-data/opentyrian-data.hash b/package/opentyrian-data/opentyrian-data.hash
new file mode 100644
index 0000000..9a7079c
--- /dev/null
+++ b/package/opentyrian-data/opentyrian-data.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 7790d09a2a3addcd33c66ef063d5900eb81cc9c342f4807eb8356364dd1d9277 tyrian21.zip
-- 
2.8.1
