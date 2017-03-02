From: Guo Ren <ren_guo@c-sky.com>
Date: Thu,  2 Mar 2017 18:34:02 +0800
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: add csky developer
In-Reply-To: <1488450842-29100-1-git-send-email-ren_guo@c-sky.com>
References: <1488450842-29100-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <1488450842-29100-4-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You can get more info from github.com/c-sky.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 DEVELOPERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bf07c3..cd4402f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -592,6 +592,11 @@ F:	package/sdl2/
 N:	Guillaume William Brs <guillaume.bressaix@gmail.com>
 F:	package/liquid-dsp/
 
+N:	Guo Ren <ren_guo@c-sky.com>
+F:	arch/Config.in.csky
+F:	board/csky
+F:	configs/csky_*
+
 N:	Gustavo Zacarias <gustavo@zacarias.com.ar>
 F:	arch/Config.in.powerpc
 F:	board/qemu/
-- 
1.9.1
