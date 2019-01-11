From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 11 Jan 2019 22:52:35 +0100
Subject: [Buildroot] [PATCH v1 2/2] barebox: change download site to https
In-Reply-To: <20190111215235.23315-1-ps.report@gmx.net>
References: <20190111215235.23315-1-ps.report@gmx.net>
Message-ID: <20190111215235.23315-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 boot/barebox/barebox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index b811e322b5..9e8a9f67b5 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -28,7 +28,7 @@ $(1)_SITE_METHOD = git
 else
 # Handle stable official Barebox versions
 $(1)_SOURCE = barebox-$$($(1)_VERSION).tar.bz2
-$(1)_SITE = http://www.barebox.org/download
+$(1)_SITE = https://www.barebox.org/download
 endif
 
 $(1)_DEPENDENCIES = host-lzop
-- 
2.20.1
