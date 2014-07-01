From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:59:25 +0200
Subject: [Buildroot] [git commit] lpc3250loader: add license information
Message-ID: <20140701224922.232169D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e20315076fe112cd2466ee810600e92d0e135daa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lpc3250loader/lpc3250loader.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
index 42beb7b..d13ab40 100644
--- a/package/lpc3250loader/lpc3250loader.mk
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -6,6 +6,8 @@
 
 HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
 HOST_LPC3250LOADER_VERSION = 1.0
+LPC3250LOADER_LICENSE = GPLv2+
+LPC3250LOADER_LICENSE_FILES = LPC3250loader.py
 
 define HOST_LPC3250LOADER_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/LPC3250loader.py \
