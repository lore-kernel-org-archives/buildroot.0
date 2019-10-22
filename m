From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 23:18:46 +0200
Subject: [Buildroot] [git commit] package/nodejs: fix check-package warnings
Message-ID: <20191022211245.28BAA83DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b79bff9156935ad9073124344c5ecbd459c45fe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/nodejs/nodejs.mk:73: expected indent with tabs
package/nodejs/nodejs.mk:74: expected indent with tabs
package/nodejs/nodejs.mk:75: expected indent with tabs

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nodejs/nodejs.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 642ada8167..dbde869937 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -70,9 +70,9 @@ define HOST_NODEJS_CONFIGURE_CMDS
 endef
 
 NODEJS_HOST_TOOLS_V8 = \
-        torque \
-        gen-regexp-special-case \
-        bytecode_builtins_list_generator
+	torque \
+	gen-regexp-special-case \
+	bytecode_builtins_list_generator
 NODEJS_HOST_TOOLS_NODE = mkcodecache
 NODEJS_HOST_TOOLS = $(NODEJS_HOST_TOOLS_V8) $(NODEJS_HOST_TOOLS_NODE)
 
