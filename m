From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 28 Mar 2014 22:24:42 +0100
Subject: [Buildroot] [PATCH 1/9] manual/configure.txt: reword part about
	internal toolchain backend
In-Reply-To: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1396041895-29533-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1396041895-29533-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 docs/manual/configure.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index badb6e4..16c86cc 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -100,7 +100,7 @@ most important ones allow to:
    toolchain should have largefile support (i.e support for files
    larger than 2 GB on 32 bits systems), IPv6 support, RPC support
    (used mainly for NFS), wide-char support, locale support (for
-   internationalization), C++ support, thread support. Depending on
+   internationalization), C++ support or thread support. Depending on
    which options you choose, the number of userspace applications and
    libraries visible in Buildroot menus will change: many applications
    and libraries require certain toolchain options to be enabled. Most
-- 
1.7.9.5
