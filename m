From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:03:56 +0200
Subject: [Buildroot] [git commit] spawn-fcgi: add license info
Message-ID: <20120815100418.BD3D7971BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f40f70d148f0897ae9d05558d91c6d10bf61f95d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/spawn-fcgi/spawn-fcgi.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 9014d21..7c23421 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -7,6 +7,8 @@
 SPAWN_FCGI_VERSION = 1.6.3
 SPAWN_FCGI_SITE = http://www.lighttpd.net/download
 SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
+SPAWN_FCGI_LICENSE = BSD-3c
+SPAWN_FCGI_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_INET_IPV6),y)
 SPAWN_FCGI_CONF_OPT = --disable-ipv6
