From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:51 -0300
Subject: [Buildroot] [PATCH 23/53] latencytop: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-23-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/latencytop/latencytop.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/latencytop/latencytop.mk b/package/latencytop/latencytop.mk
index a19f48a..7b96c2b 100644
--- a/package/latencytop/latencytop.mk
+++ b/package/latencytop/latencytop.mk
@@ -7,6 +7,8 @@
 LATENCYTOP_VERSION = 0.5
 LATENCYTOP_SITE = http://www.latencytop.org/download/
 LATENCYTOP_DEPENDENCIES = libglib2 ncurses
+LATENCYTOP_LICENSE = GPLv2
+LATENCYTOP_LICENSE_FILES = latencytop.c
 
 # NOTE: GTK is heavy weight, we intentionally build the text (ncurses)
 # version only
-- 
1.8.5.5
