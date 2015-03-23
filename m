From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 23 Mar 2015 07:52:17 +0100
Subject: [Buildroot] [PATCH] agentpp: update .hash file
Message-ID: <1427093537-28054-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the .hash file because the .tar.gz file has been regenerated.
The contents was not changed so just updating the .hash file is fine.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/agentpp/agentpp.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/agentpp/agentpp.hash b/package/agentpp/agentpp.hash
index 663e170..7c48044 100644
--- a/package/agentpp/agentpp.hash
+++ b/package/agentpp/agentpp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha512 edd9f839c33ab7287d16605249dd9d6e639fb33f48d1894b8ea8b468bb53dbd733f137f6556cb3f6e28a3806f115896a1b8401235c6441d628064edb50f057b4 agent++-4.0.3.tar.gz
+sha512 636e19a7bbc3cfbf6f1ac10d29ddd378ca81b5525be1bd09c26a1cbd20ff9cfc3d4406329147bf20994f0d59bbdb675e99e82de3837eb898a145439c5054ef96 agent++-4.0.3.tar.gz
-- 
2.3.3
