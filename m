From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Mar 2014 09:11:09 +0100
Subject: [Buildroot] [git commit] vlc: use @buildroot.org for the mailing
	list
Message-ID: <20140318081242.E3D219C10D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de60501f639afaa35c81c211b14d8d2481a15678
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that @buildroot.org is working, we should use it everywhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index ec1daf4..b7c6088 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -1,6 +1,6 @@
 if BR2_PACKAGE_VLC
 comment "vlc is known not to work in all configurations"
-comment "If you can fix it, please inform buildroot at buildroot.net"
+comment "If you can fix it, please inform buildroot at buildroot.org"
 endif
 
 config BR2_PACKAGE_VLC
