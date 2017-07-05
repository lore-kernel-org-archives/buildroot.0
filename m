From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Jul 2017 22:06:01 +0200
Subject: [Buildroot] [git commit] gssdp: add hash for license file
Message-ID: <20170705200929.1C7ED7FAE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c93c554acefd56cc016772980ffd17fd1573efb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gssdp/gssdp.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gssdp/gssdp.hash b/package/gssdp/gssdp.hash
index aac5f74..acf6b3a 100644
--- a/package/gssdp/gssdp.hash
+++ b/package/gssdp/gssdp.hash
@@ -1,2 +1,5 @@
 # Hash from: http://ftp.gnome.org/pub/gnome/sources/gssdp/1.0/gssdp-1.0.2.sha256sum:
 sha256 a1e17c09c7e1a185b0bd84fd6ff3794045a3cd729b707c23e422ff66471535dc  gssdp-1.0.2.tar.xz
+
+# Hash for license file:
+sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
