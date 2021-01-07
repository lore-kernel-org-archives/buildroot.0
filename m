From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 7 Jan 2021 23:09:47 +0100
Subject: [Buildroot] [git commit] package/environment-setup: fix spelling of
 the script file in the manual.
Message-ID: <20210107215959.BC97A8618E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7197b1bc44395cbe927dc56f0b7fc53d8ce07636
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual incorrectly refers to the script file as `setup-environment';
it is actually called `environment-setup'.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/using-buildroot-toolchain.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 110be5939f..09408ef05a 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -35,7 +35,7 @@ generating a tarball.
 
 For your convenience, by selecting the option
 +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP+, you can get a
-+setup-environment+ script installed in +output/host/+ and therefore
++environment-setup+ script installed in +output/host/+ and therefore
 in your SDK.  This script can be sourced with
 +. your/sdk/path/environment-setup+ to export a number of environment
 variables that will help cross-compile your projects using the
