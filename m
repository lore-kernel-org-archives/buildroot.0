From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 14:52:33 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/cc-tool: add hash
 for license file
Message-ID: <20200110134320.0949581682@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94b8ab0e84d90e6fbe2b313773707317462f5387
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 239dee9b3b610a74fafca49cb97ae4e9527f3834)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cc-tool/cc-tool.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cc-tool/cc-tool.hash b/package/cc-tool/cc-tool.hash
index 81844eec82..d778b44395 100644
--- a/package/cc-tool/cc-tool.hash
+++ b/package/cc-tool/cc-tool.hash
@@ -1,3 +1,6 @@
 # From http://sourceforge.net/projects/cctool/files/
 sha1 f313e55f019ea5338438633f5b5e689b699343e1  cc-tool-0.26-src.tgz
 md5 26960676f3e6264e612c299fbf8ec5ea  cc-tool-0.26-src.tgz
+
+# Hash for license file
+sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
