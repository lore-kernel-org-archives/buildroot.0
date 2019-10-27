From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 27 Oct 2019 18:49:49 +0100
Subject: [Buildroot] [PATCH 3/3] package/libsigrok: add hash for license file
In-Reply-To: <20191027174949.13805-1-fontaine.fabrice@gmail.com>
References: <20191027174949.13805-1-fontaine.fabrice@gmail.com>
Message-ID: <20191027174949.13805-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsigrok/libsigrok.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigrok/libsigrok.hash b/package/libsigrok/libsigrok.hash
index 7a52c6ca1b..e5ab5d9736 100644
--- a/package/libsigrok/libsigrok.hash
+++ b/package/libsigrok/libsigrok.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256	e40fde7af98d29e922e9d3cbe0a6c0569889153fc31e47b8b1afe4d846292b9c	libsigrok-0.5.1.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
-- 
2.23.0
