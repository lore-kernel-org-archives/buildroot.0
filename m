From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Dec 2016 22:13:23 +0100
Subject: [Buildroot] [git commit] CHANGES: update for 2016.11.1
Message-ID: <20161229212446.F412381E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5782ec23312cf230400b7b3070f6b2f467a0a69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bf8fdcc2fa06c18cf4c4381a1d80f4b89699ec82)
---
 CHANGES | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/CHANGES b/CHANGES
index d52bcdd..8dee2f5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2016.11.1, Released December 29th, 2016
+
+	Important / security related fixes.
+
+	Updated/fixed packages: apache, cryptopp, docker-engine,
+	dovecot, exim, gdk-pixbuf, libcurl, libupnp, links, monit,
+	nodejs, openssh, php, python, python-bottle, samba4, squid,
+	uboot, vim, wireshark, xorg-server uboot
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9466: VIM_REMOVE_DOCS removes rgb.txt
+
 2016.11, Released November 30th, 2016
 
 	Minor fixes.
