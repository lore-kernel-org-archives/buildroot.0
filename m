From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Sat,  5 Sep 2015 18:32:31 +0200
Subject: [Buildroot] [PATCH 1/3] Change elf2flt upstream repository
Message-ID: <1441470751-22909-1-git-send-email-public.douglas.raillard@gmail.com>
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
