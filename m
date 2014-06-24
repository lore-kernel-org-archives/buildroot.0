From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:22 -0300
Subject: [Buildroot] [PATCH 16/54] librsvg: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-16-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/librsvg/librsvg.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index 9385fe9..86dce41 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -10,6 +10,8 @@ LIBRSVG_SITE = http://ftp.gnome.org/pub/GNOME/sources/librsvg/$(LIBRSVG_VERSION_
 LIBRSVG_INSTALL_STAGING = YES
 LIBRSVG_CONF_OPT = --disable-tools
 LIBRSVG_DEPENDENCIES = libxml2 cairo pango libglib2 gdk-pixbuf
+LIBRSVG_LICENSE = LGPLv2+
+LIBRSVG_LICENSE_FILES = COPYING.LIB
 
 # If we have Gtk2, let's build it first to benefit from librsvg Gtk
 # support.
-- 
1.8.5.5
