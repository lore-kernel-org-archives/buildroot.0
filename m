From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 21:22:49 +0200
Subject: [Buildroot] [git commit] ejabberd: add a .hash file
Message-ID: <20151013192304.540FD816B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f061efd8e565ec068363e2c7d4a70f5b81eeafc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: slightly tweak the comments.]

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ejabberd/ejabberd.hash |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
new file mode 100644
index 0000000..20a4e50
--- /dev/null
+++ b/package/ejabberd/ejabberd.hash
@@ -0,0 +1,4 @@
+# From https://www.process-one.net/downloads/ejabberd/15.09/ejabberd-15.09.tgz.md5
+md5 616a2fa06064e53ef0130260116dbb68 ejabberd-15.09.tgz
+# Locally computed
+sha256 6b6bc3dba5de946927b25cf1f85b44650f9ded4923a782f21a1c9010bb58884d ejabberd-15.09.tgz
