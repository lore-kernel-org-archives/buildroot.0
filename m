From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 Oct 2015 14:27:27 +0100
Subject: [Buildroot] [PATCH buildroot-test 3/3] toolchain-configs.csv: sort
	the file alphabetically
In-Reply-To: <1444742847-43395-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1444742847-43395-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1444742847-43395-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 web/toolchains/configs/toolchain-configs.csv |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/web/toolchains/configs/toolchain-configs.csv b/web/toolchains/configs/toolchain-configs.csv
index 6c0bdb2..4486ed9 100644
--- a/web/toolchains/configs/toolchain-configs.csv
+++ b/web/toolchains/configs/toolchain-configs.csv
@@ -9,8 +9,8 @@ http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-glibc.config,x86,glibc
 http://autobuild.buildroot.org/toolchains/configs/br-arm-cortex-a9-musl.config,x86,musl
 http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config,x86,uclibc
-http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/br-arm-full-nothread.config,x86,uclibc
+http://autobuild.buildroot.org/toolchains/configs/br-arm-full-static.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/br-arm-internal-full.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/br-i386-pentium4-full.config,x86,uclibc
 http://autobuild.buildroot.org/toolchains/configs/br-microblazeel-full-internal.config,x86,glibc
-- 
1.7.1
