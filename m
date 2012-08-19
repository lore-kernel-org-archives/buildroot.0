From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 19 Aug 2012 16:18:25 -0400
Subject: [Buildroot] [PATCH 3/8] faad2: add license info
In-Reply-To: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
References: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1345407510-10058-3-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/multimedia/faad2/faad2.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/multimedia/faad2/faad2.mk b/package/multimedia/faad2/faad2.mk
index b0078f5..f3c4712 100644
--- a/package/multimedia/faad2/faad2.mk
+++ b/package/multimedia/faad2/faad2.mk
@@ -6,6 +6,8 @@
 
 FAAD2_VERSION = 2.7
 FAAD2_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/faac
+FAAD2_LICENSE = GPLv2
+FAAD2_LICENSE_FILES = COPYING
 # frontend/faad calls frexp()
 FAAD2_CONF_ENV = LIBS=-lm
 FAAD2_INSTALL_STAGING = YES
-- 
1.7.9.5
