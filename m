Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A33C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF5C184B6C;
	Fri, 28 Feb 2025 16:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0xmAfEoY8mlj; Fri, 28 Feb 2025 16:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32CBB84B6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32CBB84B6E;
	Fri, 28 Feb 2025 16:51:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E53A711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FF1942F0C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Lz4aKn95Tnz for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2B02424F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2B02424F2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8E1684C4E; Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 7 Jan 2025 19:52:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 674da4417852b5effd8df141c57d38faa819d342
X-Git-Newrev: 4d40998db891e9967f85fc1e6dd3c2c740ea7b08
X-Patchwork-Hint: ignore
Message-Id: <20250228162958.E8E1684C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/iproute2: bump to
 version 6.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4d40998db891e9967f85fc1e6dd3c2c740ea7b08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog - https://github.com/iproute2/iproute2/compare/v6.11.0...v6.12.0

Drop 0003-arpd-use-designated-initializers-for-msghdr-structur.patch.
Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=9c9824bcaf092cb99988d59717674b73b5d0d19c

Drop 0004-bridge-mst-fix-a-musl-build-issue.patch
Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=6a77abab92516e65f07f8657fc4e384c4541ce0e

Drop 0005-bridge-mst-fix-a-further-musl-build-issue.patch
Upstream commit - https://git.kernel.org/pub/scm/network/iproute2/iproute2.git/commit/?id=043ef90e2fa94397eb5c85330889ca4146a6d58a

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...signated-initializers-for-msghdr-structur.patch | 63 -------------------
 .../0004-bridge-mst-fix-a-musl-build-issue.patch   | 73 ----------------------
 ...bridge-mst-fix-a-further-musl-build-issue.patch | 56 -----------------
 package/iproute2/iproute2.hash                     |  2 +-
 package/iproute2/iproute2.mk                       |  2 +-
 5 files changed, 2 insertions(+), 194 deletions(-)

diff --git a/package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch b/package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch
deleted file mode 100644
index fbe89bac2a..0000000000
--- a/package/iproute2/0003-arpd-use-designated-initializers-for-msghdr-structur.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 32da5f26dee03600a9ca72a99016d95f05c4f1ec Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Sat, 28 Sep 2024 11:03:11 +0200
-Subject: [PATCH] arpd: use designated initializers for msghdr structure
-
-This patch fixes the following error:
-
-arpd.c:442:17: error: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
-  442 |                 NULL,   0,
-
-raised by Buildroot autobuilder [1].
-
-In the case in question, the analysis of socket.h [2] containing the
-msghdr structure shows that it has been modified with the addition of
-padding fields, which cause the compilation error. The use of designated
-initializers allows the issue to be fixed.
-
-struct msghdr {
-	void *msg_name;
-	socklen_t msg_namelen;
-	struct iovec *msg_iov;
-	int __pad1;
-	int msg_iovlen;
-	int __pad1;
-	void *msg_control;
-	int __pad2;
-	socklen_t msg_controllen;
-	int __pad2;
-	int msg_flags;
-};
-
-[1] http://autobuild.buildroot.org/results/e4cdfa38ae9578992f1c0ff5c4edae3cc0836e3c/
-[2] iproute2/host/mips64-buildroot-linux-musl/sysroot/usr/include/sys/socket.h
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=9c9824bcaf092cb99988d59717674b73b5d0d19c
----
- misc/arpd.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/misc/arpd.c b/misc/arpd.c
-index 3185620f..983e546d 100644
---- a/misc/arpd.c
-+++ b/misc/arpd.c
-@@ -437,10 +437,10 @@ static void get_kern_msg(void)
- 	struct iovec iov;
- 	char   buf[8192];
- 	struct msghdr msg = {
--		(void *)&nladdr, sizeof(nladdr),
--		&iov,	1,
--		NULL,	0,
--		0
-+		.msg_name = &nladdr,
-+		.msg_namelen = sizeof(nladdr),
-+		.msg_iov = &iov,
-+		.msg_iovlen = 1,
- 	};
- 
- 	iov.iov_base = buf;
--- 
-2.46.1
-
diff --git a/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch b/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
deleted file mode 100644
index 3deb42ae95..0000000000
--- a/package/iproute2/0004-bridge-mst-fix-a-musl-build-issue.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 0359ee6dc57ee8aa21a3f0f7404422c0f9372d3a Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Sun, 22 Sep 2024 14:00:42 +0200
-Subject: [PATCH] bridge: mst: fix a musl build issue
-
-This patch fixes a compilation error raised by the bump to version 6.11.0
-in Buildroot using musl as the C library for the cross-compilation
-toolchain.
-
-After setting the CFLGAS
-
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-IPROUTE2_CFLAGS += -D__UAPI_DEF_IN6_ADDR=0 -D__UAPI_DEF_SOCKADDR_IN6=0 \
-			-D__UAPI_DEF_IPV6_MREQ=0
-endif
-
-to fix the following errors:
-
-In file included from ../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/arpa/inet.h:9,
-                 from ../include/libnetlink.h:14,
-                 from mst.c:10:
-../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:23:8: error: redefinition of 'struct in6_addr'
-   23 | struct in6_addr {
-      |        ^~~~~~~~
-In file included from ../include/uapi/linux/if_bridge.h:19,
-                 from mst.c:7:
-../include/uapi/linux/in6.h:33:8: note: originally defined here
-   33 | struct in6_addr {
-      |        ^~~~~~~~
-../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:34:8: error: redefinition of 'struct sockaddr_in6'
-   34 | struct sockaddr_in6 {
-      |        ^~~~~~~~~~~~
-../include/uapi/linux/in6.h:50:8: note: originally defined here
-   50 | struct sockaddr_in6 {
-      |        ^~~~~~~~~~~~
-../../../host/mips64-buildroot-linux-musl/sysroot/usr/include/netinet/in.h:42:8: error: redefinition of 'struct ipv6_mreq'
-   42 | struct ipv6_mreq {
-      |        ^~~~~~~~~
-../include/uapi/linux/in6.h:60:8: note: originally defined here
-   60 | struct ipv6_mreq {
-
-I got this further errors
-
-../include/uapi/linux/in6.h:72:25: error: field 'flr_dst' has incomplete type
-   72 |         struct in6_addr flr_dst;
-      |                         ^~~~~~~
-../include/uapi/linux/if_bridge.h:711:41: error: field 'ip6' has incomplete type
-  711 |                         struct in6_addr ip6;
-      |                                         ^~~
-
-fixed by including the netinet/in.h header.
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=6a77abab92516e65f07f8657fc4e384c4541ce0e
----
- bridge/mst.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bridge/mst.c b/bridge/mst.c
-index 873ca5369fd6..c8f7e6606c3c 100644
---- a/bridge/mst.c
-+++ b/bridge/mst.c
-@@ -4,6 +4,7 @@
-  */
- 
- #include <stdio.h>
-+#include <netinet/in.h>
- #include <linux/if_bridge.h>
- #include <net/if.h>
- 
--- 
-2.43.0
-
diff --git a/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch b/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
deleted file mode 100644
index d1981f74e2..0000000000
--- a/package/iproute2/0005-bridge-mst-fix-a-further-musl-build-issue.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 62c4dfff5ff596984ece7960fba49b05d69f37a7 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Sun, 22 Sep 2024 14:11:18 +0200
-Subject: [PATCH] bridge: mst: fix a further musl build issue
-
-This patch fixes the following build errors:
-
-In file included from mst.c:11:
-../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
-   80 | _PRINT_FUNC(tv, const struct timeval *)
-      |                              ^~~~~~~
-../include/json_print.h:50:37: note: in definition of macro '_PRINT_FUNC'
-   50 |                                     type value);                        \
-      |                                     ^~~~
-../include/json_print.h:80:30: warning: 'struct timeval' declared inside parameter list will not be visible outside of this definition or declaration
-   80 | _PRINT_FUNC(tv, const struct timeval *)
-      |                              ^~~~~~~
-../include/json_print.h:55:45: note: in definition of macro '_PRINT_FUNC'
-   55 |                                             type value)                 \
-      |                                             ^~~~
-../include/json_print.h: In function 'print_tv':
-../include/json_print.h:58:48: error: passing argument 5 of 'print_color_tv' from incompatible pointer type [-Wincompatible-pointer-types]
-   58 |                                                value);                  \
-      |                                                ^~~~~
-      |                                                |
-      |                                                const struct timeval *
-../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
-   80 | _PRINT_FUNC(tv, const struct timeval *)
-      | ^~~~~~~~~~~
-../include/json_print.h:50:42: note: expected 'const struct timeval *' but argument is of type 'const struct timeval *'
-   50 |                                     type value);                        \
-      |                                          ^
-../include/json_print.h:80:1: note: in expansion of macro '_PRINT_FUNC'
-   80 | _PRINT_FUNC(tv, const struct timeval *)
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=043ef90e2fa94397eb5c85330889ca4146a6d58a
----
- bridge/mst.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/bridge/mst.c b/bridge/mst.c
-index c8f7e6606c3c..fccb7fd68140 100644
---- a/bridge/mst.c
-+++ b/bridge/mst.c
-@@ -4,6 +4,7 @@
-  */
- 
- #include <stdio.h>
-+#include <sys/time.h>
- #include <netinet/in.h>
- #include <linux/if_bridge.h>
- #include <net/if.h>
--- 
-2.43.0
-
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 028a324396..97be9bb765 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  1f795398a04aeaacd06a8f6ace2cfd913c33fa5953ca99daae83bb5c534611c3  iproute2-6.11.0.tar.xz
+sha256  bbd141ef7b5d0127cc2152843ba61f274dc32814fa3e0f13e7d07a080bef53d9  iproute2-6.12.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index c452b64cde..d609a28c0c 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 6.11.0
+IPROUTE2_VERSION = 6.12.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
