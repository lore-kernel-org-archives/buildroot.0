From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 23 Jan 2015 00:44:29 +0100
Subject: [Buildroot] [PATCH 3/3] package/infozip: add hash file
In-Reply-To: <1421970269-31287-1-git-send-email-romain.naour@openwide.fr>
References: <1421970269-31287-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421970269-31287-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/infozip/infozip.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/infozip/infozip.hash

diff --git a/package/infozip/infozip.hash b/package/infozip/infozip.hash
new file mode 100644
index 0000000..782ae5e
--- /dev/null
+++ b/package/infozip/infozip.hash
@@ -0,0 +1,2 @@
+# Locally calculated from download (no sig, hash)
+sha256	f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369	zip30.tgz
-- 
1.9.3
