From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:40:32 +0200
Subject: [Buildroot] [git commit branch/next] libvncserver: handle
	libvncserver-config script
Message-ID: <20130511204539.722639A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=726413103b8f5023b3035640f19fcdfc61f823c7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libvncserver/libvncserver.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 550abc4..a450632 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -10,6 +10,7 @@ LIBVNCSERVER_SITE = http://downloads.sourceforge.net/project/libvncserver/libvnc
 LIBVNCSERVER_LICENSE = GPLv2+
 LIBVNCSERVER_LICENSE_FILES = COPYING
 LIBVNCSERVER_INSTALL_STAGING = YES
+LIBVNCSERVER_CONFIG_SCRIPTS = libvncserver-config
 
 # only used for examples
 LIBVNCSERVER_CONF_OPT += --with-sdl-config=/bin/false
