From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 18:09:20 +0200
Subject: [Buildroot] [git commit] libaacs: add hash for license file
Message-ID: <20180429161010.611A58A286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cde0b70482d2a09f13b46174ac521dbb2370cfdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libaacs/libaacs.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libaacs/libaacs.hash b/package/libaacs/libaacs.hash
index 84947e0c3b..22310295f8 100644
--- a/package/libaacs/libaacs.hash
+++ b/package/libaacs/libaacs.hash
@@ -1,2 +1,5 @@
 # From http://download.videolan.org/pub/videolan/libaacs/0.9.0/libaacs-0.9.0.tar.bz2.sha512
 sha512 b9c658db22a0966486070d3b762509a7c0120469ab29d1e57c1b624cad309701de8b92455ec649db4d731be4a5c29c38fb4f99bb7617dbb4254270284a1903f6  libaacs-0.9.0.tar.bz2
+
+# Hash for license file:
+sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
