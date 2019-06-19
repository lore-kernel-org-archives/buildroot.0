From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 19 Jun 2019 22:05:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/haveged: fix legal-info
In-Reply-To: <1560974743-20081-1-git-send-email-pjtexier@koncepto.io>
References: <1560974743-20081-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <1560974743-20081-2-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for COPYING file

Fixes:

$: make haveged-legal-info
 >>> haveged 1.9.4 Collecting legal info
 ERROR: No hash found for COPYING

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/haveged/haveged.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index d98e1d9..0489418 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  c4959d3cb1fa6391d16a3aa1ba4d82cd3a0d497206ae4b87d638088c0664e5aa	haveged-1.9.4.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
-- 
2.7.4
