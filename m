From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:33:45 +0200
Subject: [Buildroot] [git commit] elf2flt: change upstream repository
Message-ID: <20150920133427.43DE2818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d7c1be4fc61b069919ea6bb6cc9b08d7520ae26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use Waldemar Brodkorb's repository (at least) until an
"official" upstream repository is established, to get
the ARM noMMU patches

Signed-off-by: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elf2flt/elf2flt.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
