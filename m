From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Sun,  6 Sep 2015 17:40:23 +0200
Subject: [Buildroot] [PATCH v2 1/3] elf2flt: change upstream repository
In-Reply-To: <20150906152247.001abba0@free-electrons.com>
References: <20150906152247.001abba0@free-electrons.com>
Message-ID: <1441554023-4890-1-git-send-email-public.douglas.raillard@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use Waldemar Brodkorb's repository (at least) until an
"official" upstream repository is established, to get
the ARM noMMU patches

Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>
---
 package/elf2flt/elf2flt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index 0233ed5..3fcada4 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 21c6a41885ad544763ccd19883c1353f3b0b7a47
-ELF2FLT_SITE = git://wh0rd.org/elf2flt.git
+ELF2FLT_VERSION = f859213b18a67fcfc09961267e0a1122d35186f4
+ELF2FLT_SITE = http://cgit.openadk.org/cgi/cgit/elf2flt.git
 ELF2FLT_SITE_METHOD = git
 ELF2FLT_LICENSE = GPLv2+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
-- 
2.5.1
