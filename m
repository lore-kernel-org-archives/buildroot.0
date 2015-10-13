From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 13 Oct 2015 14:19:12 +0200
Subject: [Buildroot] [PATCH v2 2/2] ejabberd: add a .hash file
Message-ID: <1444738752-24399-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
Changes v1 -> v2:
  - Add md5 from upstream.
---
 package/ejabberd/ejabberd.hash | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 package/ejabberd/ejabberd.hash

diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
new file mode 100644
index 0000000..c6344a3
--- /dev/null
+++ b/package/ejabberd/ejabberd.hash
@@ -0,0 +1,4 @@
+# md5 from: https://www.process-one.net/downloads/ejabberd/15.09/ejabberd-15.09.tgz.md5,
+# sha256 locally computed:
+md5 616a2fa06064e53ef0130260116dbb68 ejabberd-15.09.tgz
+sha256 6b6bc3dba5de946927b25cf1f85b44650f9ded4923a782f21a1c9010bb58884d ejabberd-15.09.tgz
-- 
2.1.4
