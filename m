Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA35BC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC7676069A;
	Fri, 28 Feb 2025 17:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iqTKDVVXU9DN; Fri, 28 Feb 2025 17:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2741670AD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2741670AD9;
	Fri, 28 Feb 2025 17:11:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0591B1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECFFF413A6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6caGjpCXOJTm for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1EA42F43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B1EA42F43
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66F4E86A52; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 09:55:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a956eeb96b44e42423f997b22cf37dca83cb4e76
X-Git-Newrev: ed84e971c36b43f564df881d86ac459bb5b7dad0
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.66F4E86A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/busybox bump version
 to 1.37.0
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
Content-Type: multipart/mixed; boundary="===============4801659907128662898=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4801659907128662898==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ed84e971c36b43f564df881d86ac459bb5b7dad0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Patch 0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch is
dropped as it is upstream as of
https://git.busybox.net/busybox/commit/?id=200a9669fbf6f06894e4243cccc9fc11a1a6073a

Patch 0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
is dropped as it is upstream as of
https://git.busybox.net/busybox/commit/?id=cb57abb46f06f4ede8d9ccbdaac67377fdf416cf

Patch 0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
is dropped as it is upstream as of
https://git.busybox.net/busybox/commit/?id=93e0898c663a533082b5f3c2e7dcce93ec47076d

Patch 0011-awk-fix-use-after-realloc-CVE-2021-42380-closes-1560.patch
is dropped as it is upstream as of
https://git.busybox.net/busybox/commit/?id=5dcc443dba039b305a510c01883e9f34e42656ae

Patch 0012-awk-fix-use-after-free-CVE-2023-42363.patch is dropped as
it is upstream as of
https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa

Patch 0013-awk-fix-precedence-of-relative-to.patch is dropped as it is
upstream as of
https://git.busybox.net/busybox/commit/?id=0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4

Patch 0014-awk-fix-ternary-operator-and-precedence-of.patch is dropped
as it is upstream as of
https://git.busybox.net/busybox/commit/?id=38335df9e9f45378c3407defd38b5b610578bdda

Remaining patches are renumbered/refreshed.

Patch 0010-libbb-sha-add-missing-sha-NI-guard.patch is added, taken
from the mailing list, to fix a build issue.

Patch 0011-syslogd-fix-wrong-OPT_locallog-flag-detection.patch, taken
from the mailing list, is added to fix a runtime issue with syslogd
which was pointed out by Bernd Kulhs.

Signed-off-by: Clement Ramirez <clement@clementramirez.fr>
[Thomas: update with more patches being dropped, renumber patches,
backport some patches needed to fix known build and runtime issues]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...libiproute-use-linux-if_packet.h-instead-.patch |  10 +-
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |  15 +-
 ...ddr2str-ensure-only-printable-characters-.patch |   4 +-
 ...nitize-all-printed-strings-with-printable.patch |  16 +-
 ...ix-for-glibc-2.24-not-providing-getrandom.patch |  39 ----
 ...x-getrandom-detection-for-non-glibc-libc.patch} |  30 +--
 ...-GCC-failing-saying-ncurses-is-not-found.patch} |   4 +-
 ...-for-glibc-2.24-not-providing-random-head.patch |  60 ------
 ...7-tc-Fix-compilation-with-Linux-v6.8-rc1.patch} |   4 +-
 ... 0008-awk.c-fix-CVE-2023-42366-bug-15874.patch} |   8 +-
 ...IGWINCH-and-SIGCHLD-in-hush-interrupting-.patch | 103 -----------
 ...k-for-SYS_settimeofday-before-calling-sy.patch} |   8 +-
 .../0010-libbb-sha-add-missing-sha-NI-guard.patch  |  54 ++++++
 ...-after-realloc-CVE-2021-42380-closes-1560.patch | 154 ----------------
 ...ogd-fix-wrong-OPT_locallog-flag-detection.patch |  37 ++++
 ...012-awk-fix-use-after-free-CVE-2023-42363.patch |  70 -------
 .../0013-awk-fix-precedence-of-relative-to.patch   | 203 ---------------------
 ...wk-fix-ternary-operator-and-precedence-of.patch | 102 -----------
 package/busybox/busybox.hash                       |   4 +-
 package/busybox/busybox.mk                         |   2 +-
 20 files changed, 134 insertions(+), 793 deletions(-)

diff --git a/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch b/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
index 9b5eaf89bd..76d9a371c6 100644
--- a/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
+++ b/package/busybox/0001-networking-libiproute-use-linux-if_packet.h-instead-.patch
@@ -1,4 +1,4 @@
-From 60da1d0763224698008d847eb8ad8d4d8c6f54ff Mon Sep 17 00:00:00 2001
+From e1690453cd84c798ca88cc4370710f65da86d986 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sat, 5 Oct 2013 15:55:06 +0200
 Subject: [PATCH] networking/libiproute: use <linux/if_packet.h> instead of
@@ -20,7 +20,7 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/networking/libiproute/iplink.c b/networking/libiproute/iplink.c
-index 1a1064bdc..a4c3ad307 100644
+index 37ed114bc..bc526d89c 100644
 --- a/networking/libiproute/iplink.c
 +++ b/networking/libiproute/iplink.c
 @@ -7,7 +7,7 @@
@@ -30,8 +30,8 @@ index 1a1064bdc..a4c3ad307 100644
 -#include <netpacket/packet.h>
 +#include <linux/if_packet.h>
  #include <netinet/if_ether.h>
-
+ 
  #include <linux/if_vlan.h>
---
-2.33.0
+-- 
+2.48.1
 
diff --git a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
index 3a94241043..040b0b23bf 100644
--- a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
+++ b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
@@ -1,8 +1,7 @@
-From 59daea82e7b5abcdb42a4f97a0109f14d5a774ea Mon Sep 17 00:00:00 2001
+From df20ae1280a2601a4c233ec12372d1e17db21e96 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Mon, 25 Nov 2013 22:51:53 +0100
-Subject: [PATCH] Makefile.flags: strip non -l arguments returned by
- pkg-config
+Subject: [PATCH] Makefile.flags: strip non -l arguments returned by pkg-config
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 [yann.morin.1998@free.fr: refresh for 1.29.0]
@@ -14,10 +13,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.flags b/Makefile.flags
-index 667481983..88d76efec 100644
+index 97cb4dca2..92a9063d9 100644
 --- a/Makefile.flags
 +++ b/Makefile.flags
-@@ -180,7 +180,9 @@ ifeq ($(CONFIG_SELINUX),y)
+@@ -181,7 +181,9 @@ ifeq ($(CONFIG_SELINUX),y)
  SELINUX_PC_MODULES = libselinux libsepol
  $(eval $(call pkg_check_modules,SELINUX,$(SELINUX_PC_MODULES)))
  CPPFLAGS += $(SELINUX_CFLAGS)
@@ -26,8 +25,8 @@ index 667481983..88d76efec 100644
 +       $(patsubst -l%,%,$(filter -l%,$(SELINUX_LIBS))),\
 +       $(SELINUX_PC_MODULES:lib%=%))
  endif
-
+ 
  ifeq ($(CONFIG_FEATURE_NSLOOKUP_BIG),y)
---
-2.33.0
+-- 
+2.48.1
 
diff --git a/package/busybox/0003-libbb-sockaddr2str-ensure-only-printable-characters-.patch b/package/busybox/0003-libbb-sockaddr2str-ensure-only-printable-characters-.patch
index 623b2597a2..c7800b5b0b 100644
--- a/package/busybox/0003-libbb-sockaddr2str-ensure-only-printable-characters-.patch
+++ b/package/busybox/0003-libbb-sockaddr2str-ensure-only-printable-characters-.patch
@@ -1,4 +1,4 @@
-From 9d825e854ef53ebbe0aea2f1a69f52b763104daf Mon Sep 17 00:00:00 2001
+From 68eaf20d86d4fe0f16a914817217f386155157cc Mon Sep 17 00:00:00 2001
 From: Ariadne Conill <ariadne@dereferenced.org>
 Date: Mon, 19 Sep 2022 14:15:12 +0200
 Subject: [PATCH] libbb: sockaddr2str: ensure only printable characters are
@@ -38,5 +38,5 @@ index 0e0b247b8..02c061e67 100644
  }
  
 -- 
-2.37.3
+2.48.1
 
diff --git a/package/busybox/0004-nslookup-sanitize-all-printed-strings-with-printable.patch b/package/busybox/0004-nslookup-sanitize-all-printed-strings-with-printable.patch
index bfa58465e7..3396441ebb 100644
--- a/package/busybox/0004-nslookup-sanitize-all-printed-strings-with-printable.patch
+++ b/package/busybox/0004-nslookup-sanitize-all-printed-strings-with-printable.patch
@@ -1,4 +1,4 @@
-From bd463a5564a2c0618317448c3f965d389534c3df Mon Sep 17 00:00:00 2001
+From 56b84c6efb9a06ae294eb92cf9634f70af443b0a Mon Sep 17 00:00:00 2001
 From: Ariadne Conill <ariadne@dereferenced.org>
 Date: Mon, 19 Sep 2022 14:15:12 +0200
 Subject: [PATCH] nslookup: sanitize all printed strings with printable_string
@@ -16,10 +16,10 @@ Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/networking/nslookup.c b/networking/nslookup.c
-index 6da97baf4..4bdcde1b8 100644
+index b67d354f7..79412477c 100644
 --- a/networking/nslookup.c
 +++ b/networking/nslookup.c
-@@ -407,7 +407,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+@@ -784,7 +784,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
  				//printf("Unable to uncompress domain: %s\n", strerror(errno));
  				return -1;
  			}
@@ -28,7 +28,7 @@ index 6da97baf4..4bdcde1b8 100644
  			break;
  
  		case ns_t_mx:
-@@ -422,7 +422,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+@@ -799,7 +799,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
  				//printf("Cannot uncompress MX domain: %s\n", strerror(errno));
  				return -1;
  			}
@@ -37,7 +37,7 @@ index 6da97baf4..4bdcde1b8 100644
  			break;
  
  		case ns_t_txt:
-@@ -434,7 +434,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+@@ -811,7 +811,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
  			if (n > 0) {
  				memset(dname, 0, sizeof(dname));
  				memcpy(dname, ns_rr_rdata(rr) + 1, n);
@@ -46,7 +46,7 @@ index 6da97baf4..4bdcde1b8 100644
  			}
  			break;
  
-@@ -454,7 +454,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+@@ -831,7 +831,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
  			}
  
  			printf("%s\tservice = %u %u %u %s\n", ns_rr_name(rr),
@@ -55,7 +55,7 @@ index 6da97baf4..4bdcde1b8 100644
  			break;
  
  		case ns_t_soa:
-@@ -483,7 +483,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
+@@ -860,7 +860,7 @@ static NOINLINE int parse_reply(const unsigned char *msg, size_t len)
  				return -1;
  			}
  
@@ -65,5 +65,5 @@ index 6da97baf4..4bdcde1b8 100644
  
  			printf("\tserial = %lu\n", ns_get32(cp));
 -- 
-2.37.3
+2.48.1
 
diff --git a/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch b/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
deleted file mode 100644
index 4a194612b4..0000000000
--- a/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 200a9669fbf6f06894e4243cccc9fc11a1a6073a Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 10 Apr 2023 17:26:04 +0200
-Subject: [PATCH] seedrng: fix for glibc <= 2.24 not providing getrandom()
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upstream: https://git.busybox.net/busybox/commit/?id=200a9669fbf6f06894e4243cccc9fc11a1a6073a
----
- miscutils/seedrng.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
-index 967741dc7..7cc855141 100644
---- a/miscutils/seedrng.c
-+++ b/miscutils/seedrng.c
-@@ -45,6 +45,20 @@
- #include <sys/random.h>
- #include <sys/file.h>
- 
-+/* Fix up glibc <= 2.24 not having getrandom() */
-+#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
-+#include <sys/syscall.h>
-+# define getrandom(...) bb_getrandom(__VA_ARGS__)
-+static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
-+{
-+# if defined(__NR_getrandom)
-+	return syscall(__NR_getrandom, buffer, length, flags);
-+# else
-+	return ENOSYS;
-+# endif
-+}
-+#endif
-+
- #ifndef GRND_INSECURE
- #define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
- #endif
--- 
-2.39.1
-
diff --git a/package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch b/package/busybox/0005-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
similarity index 81%
rename from package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
rename to package/busybox/0005-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
index 140b27cae6..84d7df1bf8 100644
--- a/package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
+++ b/package/busybox/0005-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
@@ -1,7 +1,7 @@
-From b2d26d449ec855602b9a88f58c2eb675de0224f2 Mon Sep 17 00:00:00 2001
+From 9fed109be1f811069cb2f727e04c6996cd44b017 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
 Date: Tue, 18 Apr 2023 15:54:43 +0200
-Subject: [PATCH v4] seedrng: fix getrandom() detection for non-glibc libc
+Subject: [PATCH] seedrng: fix getrandom() detection for non-glibc libc
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -48,33 +48,15 @@ This should fix compiling with many libc/kernel combinations.
 Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
 Upstream: http://lists.busybox.net/pipermail/busybox/2023-May/090317.html
 ---
-Changes v3 -> v4:
-  - use a variable for '#' for compatibility with GNU make 4.2.1 and earlier.
-
-Changes v2 -> v3:
-  - fix _GNU_SOURCE define location
-
-Changes v1 -> v2:
-  - move _GNU_SOURCE to bb_libtest.c
-  - remove GRND_NONBLOCK
-
-Note that I was not able to test every single combination, but I could
-confirm it builds successfully for:
-uClibc 10.0.24, linux headers 3.10 (libc getrandom NOT used)
-uClibc 1.0.36, linux headers 4.9 (libc getrandom used)
-musl 1.1.16, linux headers 4.12 (libc getrandom NOT used)
-musl 1.2.1, linux headers (libc getrandom used)
-glibc 2.25, linux headers 4.10 (libc getrandom used)
-
  Makefile.flags      | 12 ++++++++++++
  miscutils/seedrng.c |  8 ++++----
  2 files changed, 16 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.flags b/Makefile.flags
-index 1cec5ba20..0d437303a 100644
+index 92a9063d9..c8f601308 100644
 --- a/Makefile.flags
 +++ b/Makefile.flags
-@@ -161,6 +161,18 @@ ifeq ($(RT_AVAILABLE),y)
+@@ -162,6 +162,18 @@ ifeq ($(RT_AVAILABLE),y)
  LDLIBS += rt
  endif
  
@@ -94,7 +76,7 @@ index 1cec5ba20..0d437303a 100644
  # On some platforms that requires an explicit -lpthread, -ldl, -laudit.
  # However, on *other platforms* it fails when some of those flags
 diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
-index 3bf6e2ea7..2f1e18c32 100644
+index 7a2331cb1..ba98f4d19 100644
 --- a/miscutils/seedrng.c
 +++ b/miscutils/seedrng.c
 @@ -44,8 +44,10 @@
@@ -120,5 +102,5 @@ index 3bf6e2ea7..2f1e18c32 100644
  
  /* Apparently some headers don't ship with this yet. */
 -- 
-2.39.1
+2.48.1
 
diff --git a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch b/package/busybox/0006-menuconfig-GCC-failing-saying-ncurses-is-not-found.patch
similarity index 94%
rename from package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
rename to package/busybox/0006-menuconfig-GCC-failing-saying-ncurses-is-not-found.patch
index f4a926ae37..594874471d 100644
--- a/package/busybox/0009-menuconfig-gcc-failing-saying-ncurses-is-not-found.patch
+++ b/package/busybox/0006-menuconfig-GCC-failing-saying-ncurses-is-not-found.patch
@@ -1,4 +1,4 @@
-From 32949508fe566aee8988cb6d8ee101ecc5e49a65 Mon Sep 17 00:00:00 2001
+From 7f0bb7f69f38298971aa8153d3fbe9b1fdda8ae7 Mon Sep 17 00:00:00 2001
 From: ctxnop <ctxnop@gmail.com>
 Date: Sun, 26 Jan 2025 20:59:20 +0100
 Subject: [PATCH] menuconfig: GCC failing saying ncurses is not found
@@ -34,5 +34,5 @@ index 5075ebf2d..08e4da3de 100755
  	if [ $? != 0 ]; then
  	    echo " *** Unable to find the ncurses libraries or the"       1>&2
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch b/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
deleted file mode 100644
index d729884805..0000000000
--- a/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From cb57abb46f06f4ede8d9ccbdaac67377fdf416cf Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Mon, 10 Apr 2023 19:58:15 +0200
-Subject: [PATCH] seedrng: fix for glibc <= 2.24 not providing random header
-
- - dropped the wrong define (not sure why it was there)
- - <sys/random.h> not available if glibc <= 2.24
- - GRND_NONBLOCK not defined if <sys/random.h> not included
- - ret < 0 && errno == ENOSYS has to be true to get creditable set
-
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upstream: https://git.busybox.net/busybox/commit/?id=cb57abb46f06f4ede8d9ccbdaac67377fdf416cf
----
- miscutils/seedrng.c | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
-index 7cc855141..3bf6e2ea7 100644
---- a/miscutils/seedrng.c
-+++ b/miscutils/seedrng.c
-@@ -42,25 +42,31 @@
- #include "libbb.h"
- 
- #include <linux/random.h>
--#include <sys/random.h>
- #include <sys/file.h>
- 
- /* Fix up glibc <= 2.24 not having getrandom() */
- #if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
- #include <sys/syscall.h>
--# define getrandom(...) bb_getrandom(__VA_ARGS__)
- static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
- {
- # if defined(__NR_getrandom)
- 	return syscall(__NR_getrandom, buffer, length, flags);
- # else
--	return ENOSYS;
-+	errno = ENOSYS;
-+	return -1;
- # endif
- }
-+#else
-+#include <sys/random.h>
-+#endif
-+
-+/* Apparently some headers don't ship with this yet. */
-+#ifndef GRND_NONBLOCK
-+#define GRND_NONBLOCK 0x0001
- #endif
- 
- #ifndef GRND_INSECURE
--#define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
-+#define GRND_INSECURE 0x0004
- #endif
- 
- #define DEFAULT_SEED_DIR         "/var/lib/seedrng"
--- 
-2.39.1
-
diff --git a/package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch b/package/busybox/0007-tc-Fix-compilation-with-Linux-v6.8-rc1.patch
similarity index 96%
rename from package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
rename to package/busybox/0007-tc-Fix-compilation-with-Linux-v6.8-rc1.patch
index d997f00e82..c7968de788 100644
--- a/package/busybox/0010-Linux-v6.8-rc1-removed-the-definitions-related-to-CB.patch
+++ b/package/busybox/0007-tc-Fix-compilation-with-Linux-v6.8-rc1.patch
@@ -1,4 +1,4 @@
-From c4f93565acf3718111cdbaea15e1a8aacf2f44cf Mon Sep 17 00:00:00 2001
+From 1dbb3073a3a8856b9446b882f797be1bb2e21a26 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
 Date: Mon, 23 Sep 2024 18:56:00 +0200
 Subject: [PATCH] tc: Fix compilation with Linux v6.8-rc1
@@ -66,5 +66,5 @@ index 3a79fd2d9..d08fd1359 100644
  			/* don't know how to print options for this class */
  			printf("(options for %s)", name);
 -- 
-2.39.5
+2.48.1
 
diff --git a/package/busybox/0015-awk.c-fix-CVE-2023-42366-bug-15874.patch b/package/busybox/0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
similarity index 88%
rename from package/busybox/0015-awk.c-fix-CVE-2023-42366-bug-15874.patch
rename to package/busybox/0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
index 15b2cfdf00..f973223907 100644
--- a/package/busybox/0015-awk.c-fix-CVE-2023-42366-bug-15874.patch
+++ b/package/busybox/0008-awk.c-fix-CVE-2023-42366-bug-15874.patch
@@ -1,4 +1,4 @@
-From 54e64812090f58cffca08fcf11d2dbc471c964e1 Mon Sep 17 00:00:00 2001
+From 88f8a046f27cb81ccc30d038465e963b8300cf1b Mon Sep 17 00:00:00 2001
 From: Valery Ushakov <uwe@stderr.spb.ru>
 Date: Wed, 24 Jan 2024 22:24:41 +0300
 Subject: [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
@@ -21,10 +21,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/editors/awk.c b/editors/awk.c
-index 9467f4644..947195333 100644
+index 64e752f4b..222e6298d 100644
 --- a/editors/awk.c
 +++ b/editors/awk.c
-@@ -1168,9 +1168,11 @@ static uint32_t next_token(uint32_t expected)
+@@ -1234,9 +1234,11 @@ static uint32_t next_token(uint32_t expected)
  					s[-1] = bb_process_escape_sequence((const char **)&pp);
  					if (*p == '\\')
  						*s++ = '\\';
@@ -39,5 +39,5 @@ index 9467f4644..947195333 100644
  				}
  			}
 -- 
-2.47.1
+2.48.1
 
diff --git a/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch b/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
deleted file mode 100644
index 8ebb487ec6..0000000000
--- a/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 93e0898c663a533082b5f3c2e7dcce93ec47076d Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Thu, 26 Jan 2023 12:56:33 +0100
-Subject: [PATCH] shell: fix SIGWINCH and SIGCHLD (in hush) interrupting line
- input, closes 15256
-
-function                                             old     new   delta
-record_pending_signo                                  32      63     +31
-lineedit_read_key                                    231     224      -7
-------------------------------------------------------------------------------
-(add/remove: 0/0 grow/shrink: 1/1 up/down: 31/-7)              Total: 24 bytes
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upstream: https://git.busybox.net/busybox/commit/?id=93e0898c663a533082b5f3c2e7dcce93ec47076d
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libbb/lineedit.c | 17 ++++++++++-------
- shell/ash.c      |  3 ++-
- shell/hush.c     | 10 ++++++++--
- 3 files changed, 20 insertions(+), 10 deletions(-)
-
-diff --git a/libbb/lineedit.c b/libbb/lineedit.c
-index d6b2e76ff..b942f540a 100644
---- a/libbb/lineedit.c
-+++ b/libbb/lineedit.c
-@@ -2180,7 +2180,8 @@ static int lineedit_read_key(char *read_key_buffer, int timeout)
- 		 * "\xff\n",pause,"ls\n" invalid and thus won't lose "ls".
- 		 *
- 		 * If LI_INTERRUPTIBLE, return -1 if got EINTR in poll()
--		 * inside read_key, or if bb_got_signal != 0 (IOW: if signal
-+		 * inside read_key and bb_got_signal became != 0,
-+		 * or if bb_got_signal != 0 (IOW: if signal
- 		 * arrived before poll() is reached).
- 		 *
- 		 * Note: read_key sets errno to 0 on success.
-@@ -2197,14 +2198,16 @@ static int lineedit_read_key(char *read_key_buffer, int timeout)
- 			IF_FEATURE_EDITING_WINCH(S.ok_to_redraw = 0;)
- 			if (errno != EINTR)
- 				break;
-+			/* It was EINTR. Repeat read_key() unless... */
- 			if (state->flags & LI_INTERRUPTIBLE) {
--				/* LI_INTERRUPTIBLE bails out on EINTR,
--				 * but nothing really guarantees that bb_got_signal
--				 * is nonzero. Follow the least surprise principle:
-+				/* LI_INTERRUPTIBLE bails out on EINTR
-+				 * if bb_got_signal became nonzero.
-+				 * (It may stay zero: for example, our SIGWINCH
-+				 * handler does not set it. This is used for signals
-+				 * which should not interrupt line editing).
- 				 */
--				if (bb_got_signal == 0)
--					bb_got_signal = 255;
--				goto ret;
-+				if (bb_got_signal != 0)
-+					goto ret; /* will return -1 */
- 			}
- 		}
- 
-diff --git a/shell/ash.c b/shell/ash.c
-index 18ccc1329..5f8c8ea19 100644
---- a/shell/ash.c
-+++ b/shell/ash.c
-@@ -10821,7 +10821,8 @@ preadfd(void)
-  again:
- 		/* For shell, LI_INTERRUPTIBLE is set:
- 		 * read_line_input will abort on either
--		 * getting EINTR in poll(), or if it sees bb_got_signal != 0
-+		 * getting EINTR in poll() and bb_got_signal became != 0,
-+		 * or if it sees bb_got_signal != 0
- 		 * (IOW: if signal arrives before poll() is reached).
- 		 * Interactive testcases:
- 		 * (while kill -INT $$; do sleep 1; done) &
-diff --git a/shell/hush.c b/shell/hush.c
-index d111f0cc5..f064b8fd2 100644
---- a/shell/hush.c
-+++ b/shell/hush.c
-@@ -1946,7 +1946,12 @@ static void record_pending_signo(int sig)
- {
- 	sigaddset(&G.pending_set, sig);
- #if ENABLE_FEATURE_EDITING
--	bb_got_signal = sig; /* for read_line_input: "we got a signal" */
-+	if (sig != SIGCHLD
-+	 || (G_traps && G_traps[SIGCHLD] && G_traps[SIGCHLD][0])
-+	 /* ^^^ if SIGCHLD, interrupt line reading only if it has a trap */
-+	) {
-+		bb_got_signal = sig; /* for read_line_input: "we got a signal" */
-+	}
- #endif
- #if ENABLE_HUSH_FAST
- 	if (sig == SIGCHLD) {
-@@ -2669,7 +2674,8 @@ static int get_user_input(struct in_str *i)
- 		} else {
- 			/* For shell, LI_INTERRUPTIBLE is set:
- 			 * read_line_input will abort on either
--			 * getting EINTR in poll(), or if it sees bb_got_signal != 0
-+			 * getting EINTR in poll() and bb_got_signal became != 0,
-+			 * or if it sees bb_got_signal != 0
- 			 * (IOW: if signal arrives before poll() is reached).
- 			 * Interactive testcases:
- 			 * (while kill -INT $$; do sleep 1; done) &
--- 
-2.30.2
-
diff --git a/package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch b/package/busybox/0009-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
similarity index 89%
rename from package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
rename to package/busybox/0009-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
index c61cbc8107..1e95fae85c 100644
--- a/package/busybox/0016-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
+++ b/package/busybox/0009-hwclock-Check-for-SYS_settimeofday-before-calling-sy.patch
@@ -1,4 +1,4 @@
-From a378cd9c3a022500d7feaefb4e3bb43fdd789131 Mon Sep 17 00:00:00 2001
+From 0583f8eda94f97e15e371e12458877b738439e8c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 7 Mar 2021 17:30:24 -0800
 Subject: [PATCH] hwclock: Check for SYS_settimeofday before calling syscall
@@ -24,10 +24,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/util-linux/hwclock.c b/util-linux/hwclock.c
-index 723b09589..b9faaabbc 100644
+index c3fd0eb57..dea9c9a55 100644
 --- a/util-linux/hwclock.c
 +++ b/util-linux/hwclock.c
-@@ -131,6 +131,7 @@ static void show_clock(const char **pp_rtcname, int utc)
+@@ -132,6 +132,7 @@ static void show_clock(const char **pp_rtcname, int utc)
  
  static void set_kernel_tz(const struct timezone *tz)
  {
@@ -35,7 +35,7 @@ index 723b09589..b9faaabbc 100644
  #if LIBC_IS_MUSL
  	/* musl libc does not pass tz argument to syscall
  	 * because "it's deprecated by POSIX, therefore it's fine
-@@ -139,9 +140,11 @@ static void set_kernel_tz(const struct timezone *tz)
+@@ -140,9 +141,11 @@ static void set_kernel_tz(const struct timezone *tz)
  #if !defined(SYS_settimeofday) && defined(SYS_settimeofday_time32)
  # define SYS_settimeofday SYS_settimeofday_time32
  #endif
diff --git a/package/busybox/0010-libbb-sha-add-missing-sha-NI-guard.patch b/package/busybox/0010-libbb-sha-add-missing-sha-NI-guard.patch
new file mode 100644
index 0000000000..0fd7014b50
--- /dev/null
+++ b/package/busybox/0010-libbb-sha-add-missing-sha-NI-guard.patch
@@ -0,0 +1,54 @@
+From bba9e99026a3dafe75f608459533e0b6d8cf3874 Mon Sep 17 00:00:00 2001
+From: Andre Przywara <andre.przywara@arm.com>
+Date: Tue, 10 Sep 2024 14:32:46 +0100
+Subject: [PATCH] libbb/sha: add missing sha-NI guard
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The ENABLE_SHA1_HWACCEL Kconfig symbol is meant to be archicture
+agnostic, so can be enabled regardless of whether your build
+architecture provides hardware acceleration or not. At the moment only
+x86 implements this, so every piece of optimised code should be guarded
+by both ENABLE_SHA1_HWACCEL and (__x86_64__ || __i386__). This is missing
+at one place, so compiling for arm64 breaks when ENABLE_SHA1_HWACCEL is
+enabled:
+================================
+libbb/hash_md5_sha.c: In function ‘sha1_end’:
+libbb/hash_md5_sha.c:1316:28: error: ‘sha1_process_block64_shaNI’ undeclared (first use in this function); did you mean ‘sha1_process_block64’?
+ 1316 |   || ctx->process_block == sha1_process_block64_shaNI
+      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                            sha1_process_block64
+libbb/hash_md5_sha.c:1316:28: note: each undeclared identifier is reported only once for each function it appears in
+make[1]: *** [scripts/Makefile.build:197: libbb/hash_md5_sha.o] Error 1
+make: *** [Makefile:744: libbb] Error 2
+================================
+
+Add the missing guards around the call to sha1_process_block64_shaNI to
+fix the build on other architectures with ENABLE_SHA1_HWACCEL enabled.
+
+Change-Id: I40bba388422625f4230abf15a5de23e1fdc654fc
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
+Upstream: https://lists.busybox.net/pipermail/busybox/2024-September/090899.html
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ libbb/hash_md5_sha.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libbb/hash_md5_sha.c b/libbb/hash_md5_sha.c
+index 57a801459..75a61c32c 100644
+--- a/libbb/hash_md5_sha.c
++++ b/libbb/hash_md5_sha.c
+@@ -1313,7 +1313,9 @@ unsigned FAST_FUNC sha1_end(sha1_ctx_t *ctx, void *resbuf)
+ 	hash_size = 8;
+ 	if (ctx->process_block == sha1_process_block64
+ #if ENABLE_SHA1_HWACCEL
++# if defined(__GNUC__) && (defined(__i386__) || defined(__x86_64__))
+ 	 || ctx->process_block == sha1_process_block64_shaNI
++# endif
+ #endif
+ 	) {
+ 		hash_size = 5;
+-- 
+2.48.1
+
diff --git a/package/busybox/0011-awk-fix-use-after-realloc-CVE-2021-42380-closes-1560.patch b/package/busybox/0011-awk-fix-use-after-realloc-CVE-2021-42380-closes-1560.patch
deleted file mode 100644
index f0f33b11ff..0000000000
--- a/package/busybox/0011-awk-fix-use-after-realloc-CVE-2021-42380-closes-1560.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From 7c73cdaa80faf0046b07c970321557ff04f7da64 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 26 May 2023 19:36:58 +0200
-Subject: [PATCH] awk: fix use-after-realloc (CVE-2021-42380), closes 15601
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-CVE: CVE-2021-42380
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=5dcc443dba039b305a510c01883e9f34e42656ae]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
-[Thomas: taken from https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/CVE-2021-42380.patch?id=e0ff4813b1cf4df0d851c857d57fb88d7db51bdd]
-Upstream: https://git.busybox.net/busybox/commit/?id=5dcc443dba039b305a510c01883e9f34e42656ae
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- editors/awk.c       | 26 ++++++++++++++++-----
- testsuite/awk.tests | 55 +++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 75 insertions(+), 6 deletions(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index 728ee8685..2af823808 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -555,7 +555,7 @@ struct globals {
- 	const char *g_progname;
- 	int g_lineno;
- 	int nfields;
--	int maxfields; /* used in fsrealloc() only */
-+	unsigned maxfields;
- 	var *Fields;
- 	char *g_pos;
- 	char g_saved_ch;
-@@ -1931,9 +1931,9 @@ static void fsrealloc(int size)
- {
- 	int i, newsize;
- 
--	if (size >= maxfields) {
--		/* Sanity cap, easier than catering for overflows */
--		if (size > 0xffffff)
-+	if ((unsigned)size >= maxfields) {
-+		/* Sanity cap, easier than catering for over/underflows */
-+		if ((unsigned)size > 0xffffff)
- 			bb_die_memory_exhausted();
- 
- 		i = maxfields;
-@@ -2891,6 +2891,7 @@ static var *evaluate(node *op, var *res)
- 		uint32_t opinfo;
- 		int opn;
- 		node *op1;
-+		var *old_Fields_ptr;
- 
- 		opinfo = op->info;
- 		opn = (opinfo & OPNMASK);
-@@ -2899,10 +2900,16 @@ static var *evaluate(node *op, var *res)
- 		debug_printf_eval("opinfo:%08x opn:%08x\n", opinfo, opn);
- 
- 		/* execute inevitable things */
-+		old_Fields_ptr = NULL;
- 		if (opinfo & OF_RES1) {
- 			if ((opinfo & OF_REQUIRED) && !op1)
- 				syntax_error(EMSG_TOO_FEW_ARGS);
- 			L.v = evaluate(op1, TMPVAR0);
-+			/* Does L.v point to $n variable? */
-+			if ((size_t)(L.v - Fields) < maxfields) {
-+				/* yes, remember where Fields[] is */
-+				old_Fields_ptr = Fields;
-+			}
- 			if (opinfo & OF_STR1) {
- 				L.s = getvar_s(L.v);
- 				debug_printf_eval("L.s:'%s'\n", L.s);
-@@ -2921,8 +2928,15 @@ static var *evaluate(node *op, var *res)
- 		 */
- 		if (opinfo & OF_RES2) {
- 			R.v = evaluate(op->r.n, TMPVAR1);
--			//TODO: L.v may be invalid now, set L.v to NULL to catch bugs?
--			//L.v = NULL;
-+			/* Seen in $5=$$5=$0:
-+			 * Evaluation of R.v ($$5=$0 expression)
-+			 * made L.v ($5) invalid. It's detected here.
-+			 */
-+			if (old_Fields_ptr) {
-+				//if (old_Fields_ptr != Fields)
-+				//	debug_printf_eval("L.v moved\n");
-+				L.v += Fields - old_Fields_ptr;
-+			}
- 			if (opinfo & OF_STR2) {
- 				R.s = getvar_s(R.v);
- 				debug_printf_eval("R.s:'%s'\n", R.s);
-diff --git a/testsuite/awk.tests b/testsuite/awk.tests
-index bbf0fbff1..ddc51047b 100755
---- a/testsuite/awk.tests
-+++ b/testsuite/awk.tests
-@@ -485,4 +485,59 @@ testing 'awk assign while test' \
- 	"" \
- 	"foo"
- 
-+# User-supplied bug (SEGV) example, was causing use-after-realloc
-+testing 'awk assign while assign' \
-+	"awk '\$5=\$\$5=\$0'; echo \$?" \
-+	"\
-+─ process timing ────────────────────────────────────┬─ ─ process timing ────────────────────────────────────┬─ overall results ────┐ results ────┐
-+│ run time : │        run time : 0 days, 0 hrs, 0 min, 56 sec      │  cycles done : 0     │ days, 0 hrs, 0 min, 56 sec │ cycles done : 0 │
-+│ last new find │   last new find : 0 days, 0 hrs, 0 min, 1 sec       │ corpus count : 208   │ 0 days, 0 hrs, 0 min, 1 sec │ corpus count : 208 │
-+│last saved crash : │last saved crash : none seen yet                     │saved crashes : 0     │ seen yet │saved crashes : 0 │
-+│ last saved hang │ last saved hang : none seen yet                     │  saved hangs : 0     │ none seen yet │ saved hangs : 0 │
-+├─ cycle progress ─────────────────────┬─ ├─ cycle progress ─────────────────────┬─ map coverage┴──────────────────────┤ coverage┴──────────────────────┤
-+│ now processing : │  now processing : 184.1 (88.5%)      │    map density : 0.30% / 0.52%      │ (88.5%) │ map density : 0.30% / 0.52% │                                                                                                                                                                          │  now processing : 184.1 (88.5%)      │    map density : 0.30% / 0.52%      │
-+│ runs timed out │  runs timed out : 0 (0.00%)          │ count coverage : 2.18 bits/tuple    │ 0 (0.00%) │ count coverage : 2.18 bits/tuple │
-+├─ stage progress ─────────────────────┼─ ├─ stage progress ─────────────────────┼─ findings in depth ─────────────────┤ in depth ─────────────────┤
-+│ now trying : │  now trying : havoc                  │ favored items : 43 (20.67%)         │ │ favored items : 43 (20.67%) │
-+│ stage execs : │ stage execs : 11.2k/131k (8.51%)     │  new edges on : 52 (25.00%)         │ (8.51%) │ new edges on │ stage execs : 11.2k/131k (8.51%)     │  new edges on : 52 (25.00%)         │ 52 (25.00%) │
-+│ total execs : │ total execs : 179k                   │ total crashes : 0 (0 saved)         │ │ total crashes : 0 (0 saved) │                                                                                                                                                                      │ total execs : 179k                   │ total crashes : 0 (0 saved)         │
-+│ exec speed : │  exec speed : 3143/sec               │  total tmouts : 0 (0 saved)         │ │ total tmouts : 0 (0 saved) │                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                                                                                                                     │  exec speed : 3143/sec               │  total tmouts : 0 (0 saved)         │
-+├─ fuzzing strategy yields ├─ fuzzing strategy yields ────────────┴─────────────┬─ item geometry ───────┤ item geometry ───────┤
-+│ bit flips : │   bit flips : 11/648, 4/638, 5/618                 │    levels : 4         │ 4/638, 5/618 │ levels : │   bit flips : 11/648, 4/638, 5/618                 │    levels : 4         │ │
-+│ byte flips : │  byte flips : 0/81, 0/71, 0/52                     │   pending : 199       │ 0/71, 0/52 │ pending : 199 │
-+│ arithmetics : 11/4494, │ arithmetics : 11/4494, 0/1153, 0/0                 │  pend fav : 35        │ 0/0 │ pend fav : 35 │
-+│  known ints : 1/448, 0/1986, 0/2288                │ own finds : 207       │ known ints : │  known ints : 1/448, 0/1986, 0/2288                │ own finds : 207       │ 0/1986, 0/2288 │ own finds : 207 │
-+│ dictionary : 0/0, │  dictionary : 0/0, 0/0, 0/0, 0/0                   │  imported : 0         │ 0/0, 0/0 │ imported : 0 │
-+│havoc/splice : 142/146k, 23/7616 │havoc/splice : 142/146k, 23/7616                    │ stability : 100.00%   │ stability : 100.00% │
-+│py/custom/rq : unused, unused, │py/custom/rq : unused, unused, unused, unused       ├───────────────────────┘ unused ├───────────────────────┘
-+│ trim/eff : 57.02%/26, │    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%] │ [cpu000:100%]
-+└────────────────────────────────────────────────────┘^C    └────────────────────────────────────────────────────┘^C
-+0
-+" \
-+	"" \
-+	"\
-+─ process timing ────────────────────────────────────┬─ overall results ────┐
-+│        run time : 0 days, 0 hrs, 0 min, 56 sec      │  cycles done : 0     │
-+│   last new find : 0 days, 0 hrs, 0 min, 1 sec       │ corpus count : 208   │
-+│last saved crash : none seen yet                     │saved crashes : 0     │
-+│ last saved hang : none seen yet                     │  saved hangs : 0     │
-+├─ cycle progress ─────────────────────┬─ map coverage┴──────────────────────┤
-+│  now processing : 184.1 (88.5%)      │    map density : 0.30% / 0.52%      │
-+│  runs timed out : 0 (0.00%)          │ count coverage : 2.18 bits/tuple    │
-+├─ stage progress ─────────────────────┼─ findings in depth ─────────────────┤
-+│  now trying : havoc                  │ favored items : 43 (20.67%)         │
-+│ stage execs : 11.2k/131k (8.51%)     │  new edges on : 52 (25.00%)         │
-+│ total execs : 179k                   │ total crashes : 0 (0 saved)         │
-+│  exec speed : 3143/sec               │  total tmouts : 0 (0 saved)         │
-+├─ fuzzing strategy yields ────────────┴─────────────┬─ item geometry ───────┤
-+│   bit flips : 11/648, 4/638, 5/618                 │    levels : 4         │
-+│  byte flips : 0/81, 0/71, 0/52                     │   pending : 199       │
-+│ arithmetics : 11/4494, 0/1153, 0/0                 │  pend fav : 35        │
-+│  known ints : 1/448, 0/1986, 0/2288                │ own finds : 207       │
-+│  dictionary : 0/0, 0/0, 0/0, 0/0                   │  imported : 0         │
-+│havoc/splice : 142/146k, 23/7616                    │ stability : 100.00%   │
-+│py/custom/rq : unused, unused, unused, unused       ├───────────────────────┘
-+│    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%]
-+└────────────────────────────────────────────────────┘^C"
-+
- exit $FAILCOUNT
--- 
-2.47.1
-
diff --git a/package/busybox/0011-syslogd-fix-wrong-OPT_locallog-flag-detection.patch b/package/busybox/0011-syslogd-fix-wrong-OPT_locallog-flag-detection.patch
new file mode 100644
index 0000000000..1dfd6f3793
--- /dev/null
+++ b/package/busybox/0011-syslogd-fix-wrong-OPT_locallog-flag-detection.patch
@@ -0,0 +1,37 @@
+From 34d331d642c3312e1c04e4650f547f1a67abee24 Mon Sep 17 00:00:00 2001
+From: Andrej Valek <andrej.v@skyrain.eu>
+Date: Wed, 16 Oct 2024 10:15:08 +0200
+Subject: [PATCH] syslogd: fix wrong OPT_locallog flag detection
+
+The OPT_locallog was set on "option_mask32" but checked on local
+"opts" variable. While this flag it's used on multiple places can't be
+has to be used with "option_mask32". Without this change syslogd
+is more-less unusable while no messages are logged locally.
+
+Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
+Upstream: https://lists.busybox.net/pipermail/busybox/2024-October/090969.html
+[Thomas: this was reported as beeing needed by Bernd Kuhls at
+https://lore.kernel.org/buildroot/pan$de0bb$35c5a64$ca9b6f21$2408ff40@ID-313208.user.individual.net/,
+but also on the Busybox mailing list at
+https://lists.busybox.net/pipermail/busybox/2023-September/090499.html]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ sysklogd/syslogd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysklogd/syslogd.c b/sysklogd/syslogd.c
+index 7558051f0..fa03aa280 100644
+--- a/sysklogd/syslogd.c
++++ b/sysklogd/syslogd.c
+@@ -1179,7 +1179,7 @@ int syslogd_main(int argc UNUSED_PARAM, char **argv)
+ 			}
+ 		}
+ #endif
+-		if (!ENABLE_FEATURE_REMOTE_LOG || (opts & OPT_locallog)) {
++		if (!ENABLE_FEATURE_REMOTE_LOG || (option_mask32 & OPT_locallog)) {
+ 			recvbuf[sz] = '\0'; /* ensure it *is* NUL terminated */
+ 			split_escape_and_log(recvbuf, sz);
+ 		}
+-- 
+2.48.1
+
diff --git a/package/busybox/0012-awk-fix-use-after-free-CVE-2023-42363.patch b/package/busybox/0012-awk-fix-use-after-free-CVE-2023-42363.patch
deleted file mode 100644
index 92a6c36d01..0000000000
--- a/package/busybox/0012-awk-fix-use-after-free-CVE-2023-42363.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 20a91edce02adc258038a2e9bf5bda0fe27a5050 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Mon, 20 May 2024 17:55:28 +0200
-Subject: [PATCH] awk: fix use after free (CVE-2023-42363)
-
-function                                             old     new   delta
-evaluate                                            3377    3385      +8
-
-Fixes https://bugs.busybox.net/show_bug.cgi?id=15865
-
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-CVE: CVE-2023-42363
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
-[Thomas: taken from https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/CVE-2023-42363.patch?id=e0ff4813b1cf4df0d851c857d57fb88d7db51bdd]
-Upstream: https://git.busybox.net/busybox/commit/?id=fb08d43d44d1fea1f741fafb9aa7e1958a5f69aa
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- editors/awk.c | 21 +++++++++++++--------
- 1 file changed, 13 insertions(+), 8 deletions(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index 2af823808..d45724d59 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -2910,19 +2910,14 @@ static var *evaluate(node *op, var *res)
- 				/* yes, remember where Fields[] is */
- 				old_Fields_ptr = Fields;
- 			}
--			if (opinfo & OF_STR1) {
--				L.s = getvar_s(L.v);
--				debug_printf_eval("L.s:'%s'\n", L.s);
--			}
- 			if (opinfo & OF_NUM1) {
- 				L_d = getvar_i(L.v);
- 				debug_printf_eval("L_d:%f\n", L_d);
- 			}
- 		}
--		/* NB: Must get string/numeric values of L (done above)
--		 * _before_ evaluate()'ing R.v: if both L and R are $NNNs,
--		 * and right one is large, then L.v points to Fields[NNN1],
--		 * second evaluate() reallocates and moves (!) Fields[],
-+		/* NB: if both L and R are $NNNs, and right one is large,
-+		 * then at this pint L.v points to Fields[NNN1], second
-+		 * evaluate() below reallocates and moves (!) Fields[],
- 		 * R.v points to Fields[NNN2] but L.v now points to freed mem!
- 		 * (Seen trying to evaluate "$444 $44444")
- 		 */
-@@ -2942,6 +2937,16 @@ static var *evaluate(node *op, var *res)
- 				debug_printf_eval("R.s:'%s'\n", R.s);
- 			}
- 		}
-+		/* Get L.s _after_ R.v is evaluated: it may have realloc'd L.v
-+		 * so we must get the string after "old_Fields_ptr" correction
-+		 * above. Testcase: x = (v = "abc", gsub("b", "X", v));
-+		 */
-+		if (opinfo & OF_RES1) {
-+			if (opinfo & OF_STR1) {
-+				L.s = getvar_s(L.v);
-+				debug_printf_eval("L.s:'%s'\n", L.s);
-+			}
-+		}
- 
- 		debug_printf_eval("switch(0x%x)\n", XC(opinfo & OPCLSMASK));
- 		switch (XC(opinfo & OPCLSMASK)) {
--- 
-2.47.1
-
diff --git a/package/busybox/0013-awk-fix-precedence-of-relative-to.patch b/package/busybox/0013-awk-fix-precedence-of-relative-to.patch
deleted file mode 100644
index 596036d8fc..0000000000
--- a/package/busybox/0013-awk-fix-precedence-of-relative-to.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-From 47ff44735c0cd05efd899fb3486aca77e65fbe15 Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Tue, 30 May 2023 16:42:18 +0200
-Subject: [PATCH] awk: fix precedence of = relative to ==
-
-Discovered while adding code to disallow assignments to non-lvalues
-
-function                                             old     new   delta
-parse_expr                                           936     991     +55
-.rodata                                           105243  105247      +4
-------------------------------------------------------------------------------
-(add/remove: 0/0 grow/shrink: 2/0 up/down: 59/0)               Total: 59 bytes
-
-CVE: CVE-2023-42364 CVE-2023-42365
-
-Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4]
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-(cherry picked from commit 0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4)
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Thomas: taken from https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/0001-awk-fix-precedence-of-relative-to.patch?id=e0ff4813b1cf4df0d851c857d57fb88d7db51bdd]
-Upstream: https://git.busybox.net/busybox/commit/?id=0256e00a9d077588bd3a39f5a1ef7e2eaa2911e4
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- editors/awk.c       | 66 ++++++++++++++++++++++++++++++---------------
- testsuite/awk.tests |  5 ++++
- 2 files changed, 50 insertions(+), 21 deletions(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index d45724d59..5962c3f6a 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -337,7 +337,9 @@ static void debug_parse_print_tc(uint32_t n)
- #undef P
- #undef PRIMASK
- #undef PRIMASK2
--#define P(x)      (x << 24)
-+/* Smaller 'x' means _higher_ operator precedence */
-+#define PRECEDENCE(x) (x << 24)
-+#define P(x)      PRECEDENCE(x)
- #define PRIMASK   0x7F000000
- #define PRIMASK2  0x7E000000
- 
-@@ -360,7 +362,7 @@ enum {
- 	OC_MOVE = 0x1f00,       OC_PGETLINE = 0x2000,   OC_REGEXP = 0x2100,
- 	OC_REPLACE = 0x2200,    OC_RETURN = 0x2300,     OC_SPRINTF = 0x2400,
- 	OC_TERNARY = 0x2500,    OC_UNARY = 0x2600,      OC_VAR = 0x2700,
--	OC_DONE = 0x2800,
-+	OC_CONST = 0x2800,      OC_DONE = 0x2900,
- 
- 	ST_IF = 0x3000,         ST_DO = 0x3100,         ST_FOR = 0x3200,
- 	ST_WHILE = 0x3300
-@@ -440,9 +442,9 @@ static const uint32_t tokeninfo[] ALIGN4 = {
- #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
- #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
- 	TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5),
--	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(74),        OC_REPLACE|NV|P(74)|'+', OC_REPLACE|NV|P(74)|'-',
--	OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P(74)|'%', OC_REPLACE|NV|P(74)|'&',
--	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(74)|'&', OC_BINARY|NV|P(15)|'&',
-+	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P(38)|'+', OC_REPLACE|NV|P(38)|'-',
-+	OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P(38)|'%', OC_REPLACE|NV|P(38)|'&',
-+	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(38)|'&', OC_BINARY|NV|P(15)|'&',
- 	OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(15)|'&',  OC_BINARY|NV|P(25)|'*',
- 	OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P(39)|0,   OC_COMPARE|VV|P(39)|1,
- #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
-@@ -1290,7 +1292,7 @@ static uint32_t next_token(uint32_t expected)
- 			save_tclass = tc;
- 			save_info = t_info;
- 			tc = TC_BINOPX;
--			t_info = OC_CONCAT | SS | P(35);
-+			t_info = OC_CONCAT | SS | PRECEDENCE(35);
- 		}
- 
- 		t_tclass = tc;
-@@ -1350,9 +1352,8 @@ static node *parse_expr(uint32_t term_tc)
- {
- 	node sn;
- 	node *cn = &sn;
--	node *vn, *glptr;
-+	node *glptr;
- 	uint32_t tc, expected_tc;
--	var *v;
- 
- 	debug_printf_parse("%s() term_tc(%x):", __func__, term_tc);
- 	debug_parse_print_tc(term_tc);
-@@ -1363,11 +1364,12 @@ static node *parse_expr(uint32_t term_tc)
- 	expected_tc = TS_OPERAND | TS_UOPPRE | TC_REGEXP | term_tc;
- 
- 	while (!((tc = next_token(expected_tc)) & term_tc)) {
-+		node *vn;
- 
- 		if (glptr && (t_info == TI_LESS)) {
- 			/* input redirection (<) attached to glptr node */
- 			debug_printf_parse("%s: input redir\n", __func__);
--			cn = glptr->l.n = new_node(OC_CONCAT | SS | P(37));
-+			cn = glptr->l.n = new_node(OC_CONCAT | SS | PRECEDENCE(37));
- 			cn->a.n = glptr;
- 			expected_tc = TS_OPERAND | TS_UOPPRE;
- 			glptr = NULL;
-@@ -1379,24 +1381,42 @@ static node *parse_expr(uint32_t term_tc)
- 			 * previous operators with higher priority */
- 			vn = cn;
- 			while (((t_info & PRIMASK) > (vn->a.n->info & PRIMASK2))
--			    || ((t_info == vn->info) && t_info == TI_COLON)
-+			    || (t_info == vn->info && t_info == TI_COLON)
- 			) {
- 				vn = vn->a.n;
- 				if (!vn->a.n) syntax_error(EMSG_UNEXP_TOKEN);
- 			}
- 			if (t_info == TI_TERNARY)
- //TODO: why?
--				t_info += P(6);
-+				t_info += PRECEDENCE(6);
- 			cn = vn->a.n->r.n = new_node(t_info);
- 			cn->a.n = vn->a.n;
- 			if (tc & TS_BINOP) {
- 				cn->l.n = vn;
--//FIXME: this is the place to detect and reject assignments to non-lvalues.
--//Currently we allow "assignments" to consts and temporaries, nonsense like this:
--// awk 'BEGIN { "qwe" = 1 }'
--// awk 'BEGIN { 7 *= 7 }'
--// awk 'BEGIN { length("qwe") = 1 }'
--// awk 'BEGIN { (1+1) += 3 }'
-+
-+				/* Prevent:
-+				 * awk 'BEGIN { "qwe" = 1 }'
-+				 * awk 'BEGIN { 7 *= 7 }'
-+				 * awk 'BEGIN { length("qwe") = 1 }'
-+				 * awk 'BEGIN { (1+1) += 3 }'
-+				 */
-+				/* Assignment? (including *= and friends) */
-+				if (((t_info & OPCLSMASK) == OC_MOVE)
-+				 || ((t_info & OPCLSMASK) == OC_REPLACE)
-+				) {
-+					debug_printf_parse("%s: MOVE/REPLACE vn->info:%08x\n", __func__, vn->info);
-+					/* Left side is a (variable or array element)
-+					 * or function argument
-+					 * or $FIELD ?
-+					 */
-+					if ((vn->info & OPCLSMASK) != OC_VAR
-+					 && (vn->info & OPCLSMASK) != OC_FNARG
-+					 && (vn->info & OPCLSMASK) != OC_FIELD
-+					) {
-+						syntax_error(EMSG_UNEXP_TOKEN); /* no. bad */
-+					}
-+				}
-+
- 				expected_tc = TS_OPERAND | TS_UOPPRE | TC_REGEXP;
- 				if (t_info == TI_PGETLINE) {
- 					/* it's a pipe */
-@@ -1432,6 +1452,8 @@ static node *parse_expr(uint32_t term_tc)
- 		/* one should be very careful with switch on tclass -
- 		 * only simple tclasses should be used (TC_xyz, not TS_xyz) */
- 		switch (tc) {
-+			var *v;
-+
- 		case TC_VARIABLE:
- 		case TC_ARRAY:
- 			debug_printf_parse("%s: TC_VARIABLE | TC_ARRAY\n", __func__);
-@@ -1452,14 +1474,14 @@ static node *parse_expr(uint32_t term_tc)
- 		case TC_NUMBER:
- 		case TC_STRING:
- 			debug_printf_parse("%s: TC_NUMBER | TC_STRING\n", __func__);
--			cn->info = OC_VAR;
-+			cn->info = OC_CONST;
- 			v = cn->l.v = xzalloc(sizeof(var));
--			if (tc & TC_NUMBER)
-+			if (tc & TC_NUMBER) {
- 				setvar_i(v, t_double);
--			else {
-+			 } else {
- 				setvar_s(v, t_string);
--				expected_tc &= ~TC_UOPPOST; /* "str"++ is not allowed */
- 			}
-+			expected_tc &= ~TC_UOPPOST; /* NUM++, "str"++ not allowed */
- 			break;
- 
- 		case TC_REGEXP:
-@@ -3107,6 +3129,8 @@ static var *evaluate(node *op, var *res)
- 
- 		/* -- recursive node type -- */
- 
-+		case XC( OC_CONST ):
-+			debug_printf_eval("CONST ");
- 		case XC( OC_VAR ):
- 			debug_printf_eval("VAR\n");
- 			L.v = op->l.v;
-diff --git a/testsuite/awk.tests b/testsuite/awk.tests
-index ddc51047b..a78fdcd98 100755
---- a/testsuite/awk.tests
-+++ b/testsuite/awk.tests
-@@ -540,4 +540,9 @@ testing 'awk assign while assign' \
- │    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%]
- └────────────────────────────────────────────────────┘^C"
- 
-+testing "awk = has higher precedence than == (despite what gawk manpage claims)" \
-+	"awk 'BEGIN { v=1; print 2==v; print 2==v=2; print v; print v=3==3; print v}'" \
-+	'0\n1\n2\n1\n3\n' \
-+	'' ''
-+
- exit $FAILCOUNT
--- 
-2.47.1
-
diff --git a/package/busybox/0014-awk-fix-ternary-operator-and-precedence-of.patch b/package/busybox/0014-awk-fix-ternary-operator-and-precedence-of.patch
deleted file mode 100644
index 78f21481cc..0000000000
--- a/package/busybox/0014-awk-fix-ternary-operator-and-precedence-of.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 173164c6b2f2ad17dd14d3a43e5bff47abde7199 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Tue, 21 May 2024 14:46:08 +0200
-Subject: [PATCH] awk: fix ternary operator and precedence of =
-
-Adjust the = precedence test to match behavior of gawk, mawk and
-FreeBSD.  awk 'BEGIN {print v=3==3; print v}' should print two '1'.
-
-To fix this, and to unbreak the ternary conditional operator, we restore
-the precedence of = in the token list, but override this with a lower
-priority when the assignment is on the right side of a compare.
-
-This fixes commit 0256e00a9d07 (awk: fix precedence of = relative to ==) [1]
-
-CVE: CVE-2023-42364 CVE-2023-42365
-
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-May/090766.html]
-
-[1] https://bugs.busybox.net/show_bug.cgi?id=15871#c6
-
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
-(cherry picked from commit 1714301c405ef03b39605c85c23f22a190cddd95)
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Thomas: taken from https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/0002-awk-fix-ternary-operator-and-precedence-of.patch?id=e0ff4813b1cf4df0d851c857d57fb88d7db51bdd]
-Upstream: https://git.busybox.net/busybox/commit/?id=38335df9e9f45378c3407defd38b5b610578bdda
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- editors/awk.c       | 18 ++++++++++++++----
- testsuite/awk.tests |  9 +++++++--
- 2 files changed, 21 insertions(+), 6 deletions(-)
-
-diff --git a/editors/awk.c b/editors/awk.c
-index 5962c3f6a..9467f4644 100644
---- a/editors/awk.c
-+++ b/editors/awk.c
-@@ -442,9 +442,10 @@ static const uint32_t tokeninfo[] ALIGN4 = {
- #define TI_PREINC (OC_UNARY|xV|P(9)|'P')
- #define TI_PREDEC (OC_UNARY|xV|P(9)|'M')
- 	TI_PREINC,               TI_PREDEC,               OC_FIELD|xV|P(5),
--	OC_COMPARE|VV|P(39)|5,   OC_MOVE|VV|P(38),        OC_REPLACE|NV|P(38)|'+', OC_REPLACE|NV|P(38)|'-',
--	OC_REPLACE|NV|P(38)|'*', OC_REPLACE|NV|P(38)|'/', OC_REPLACE|NV|P(38)|'%', OC_REPLACE|NV|P(38)|'&',
--	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(38)|'&', OC_BINARY|NV|P(15)|'&',
-+#define TI_ASSIGN (OC_MOVE|VV|P(74))
-+	OC_COMPARE|VV|P(39)|5,   TI_ASSIGN,               OC_REPLACE|NV|P(74)|'+', OC_REPLACE|NV|P(74)|'-',
-+	OC_REPLACE|NV|P(74)|'*', OC_REPLACE|NV|P(74)|'/', OC_REPLACE|NV|P(74)|'%', OC_REPLACE|NV|P(74)|'&',
-+	OC_BINARY|NV|P(29)|'+',  OC_BINARY|NV|P(29)|'-',  OC_REPLACE|NV|P(74)|'&', OC_BINARY|NV|P(15)|'&',
- 	OC_BINARY|NV|P(25)|'/',  OC_BINARY|NV|P(25)|'%',  OC_BINARY|NV|P(15)|'&',  OC_BINARY|NV|P(25)|'*',
- 	OC_COMPARE|VV|P(39)|4,   OC_COMPARE|VV|P(39)|3,   OC_COMPARE|VV|P(39)|0,   OC_COMPARE|VV|P(39)|1,
- #define TI_LESS     (OC_COMPARE|VV|P(39)|2)
-@@ -1376,11 +1377,19 @@ static node *parse_expr(uint32_t term_tc)
- 			continue;
- 		}
- 		if (tc & (TS_BINOP | TC_UOPPOST)) {
-+			int prio;
- 			debug_printf_parse("%s: TS_BINOP | TC_UOPPOST tc:%x\n", __func__, tc);
- 			/* for binary and postfix-unary operators, jump back over
- 			 * previous operators with higher priority */
- 			vn = cn;
--			while (((t_info & PRIMASK) > (vn->a.n->info & PRIMASK2))
-+			/* Let assignment get higher priority when used on right
-+			 * side in compare. i.e: 2==v=3 */
-+			if (t_info == TI_ASSIGN && (vn->a.n->info & OPCLSMASK) == OC_COMPARE) {
-+				prio = PRECEDENCE(38);
-+			} else {
-+				prio = (t_info & PRIMASK);
-+			}
-+			while ((prio > (vn->a.n->info & PRIMASK2))
- 			    || (t_info == vn->info && t_info == TI_COLON)
- 			) {
- 				vn = vn->a.n;
-@@ -1412,6 +1421,7 @@ static node *parse_expr(uint32_t term_tc)
- 					if ((vn->info & OPCLSMASK) != OC_VAR
- 					 && (vn->info & OPCLSMASK) != OC_FNARG
- 					 && (vn->info & OPCLSMASK) != OC_FIELD
-+					 && (vn->info & OPCLSMASK) != OC_COMPARE
- 					) {
- 						syntax_error(EMSG_UNEXP_TOKEN); /* no. bad */
- 					}
-diff --git a/testsuite/awk.tests b/testsuite/awk.tests
-index a78fdcd98..d2706dea9 100755
---- a/testsuite/awk.tests
-+++ b/testsuite/awk.tests
-@@ -540,9 +540,14 @@ testing 'awk assign while assign' \
- │    trim/eff : 57.02%/26, 0.00%                     │          [cpu000:100%]
- └────────────────────────────────────────────────────┘^C"
- 
--testing "awk = has higher precedence than == (despite what gawk manpage claims)" \
-+testing "awk = has higher precedence than == on right side" \
- 	"awk 'BEGIN { v=1; print 2==v; print 2==v=2; print v; print v=3==3; print v}'" \
--	'0\n1\n2\n1\n3\n' \
-+	'0\n1\n2\n1\n1\n' \
-+	'' ''
-+
-+testing 'awk ternary precedence' \
-+	"awk 'BEGIN { a = 0 ? \"yes\": \"no\"; print a }'" \
-+	'no\n' \
- 	'' ''
- 
- exit $FAILCOUNT
--- 
-2.47.1
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 6eba365ecc..39ca8915f3 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,5 +1,5 @@
-# From https://busybox.net/downloads/busybox-1.36.1.tar.bz2.sha256
-sha256  b8cc24c9574d809e7279c3be349795c5d5ceb6fdf19ca709f80cde50e47de314  busybox-1.36.1.tar.bz2
+# From https://busybox.net/downloads/busybox-1.37.0.tar.bz2.sha256
+sha256  3311dff32e746499f4df0d5df04d7eb396382d7e108bb9250e7b519b837043a4  busybox-1.37.0.tar.bz2
 # Locally computed
 sha256  bbfc9843646d483c334664f651c208b9839626891d8f17604db2146962f43548  LICENSE
 sha256  b5a136ed67798e51fe2e0ca0b2a21cb01b904ff0c9f7d563a6292e276607e58f  archival/libarchive/bz/LICENSE
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index d61fed9879..900e5e7877 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.36.1
+BUSYBOX_VERSION = 1.37.0
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4

--===============4801659907128662898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4801659907128662898==--
