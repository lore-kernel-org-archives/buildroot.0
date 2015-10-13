From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 13 Oct 2015 12:04:37 +0200
Subject: [Buildroot] [PATCH 2/2] ejabberd: add a .hash file
In-Reply-To: <1444730677-21730-1-git-send-email-johan.oudinet@gmail.com>
References: <1444730677-21730-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1444730677-21730-2-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/ejabberd.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/ejabberd/ejabberd.hash

diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
new file mode 100644
index 0000000..a9e0093
--- /dev/null
+++ b/package/ejabberd/ejabberd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 6b6bc3dba5de946927b25cf1f85b44650f9ded4923a782f21a1c9010bb58884d ejabberd-15.09.tgz
-- 
2.1.4
