From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:31 +0200
Subject: [Buildroot] [PATCH 09/16] libvncserver: handle libvncserver-config
	script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvncserver/libvncserver.mk |    1 +
 1 file changed, 1 insertion(+)

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
-- 
1.7.9.5
