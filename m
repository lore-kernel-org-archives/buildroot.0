From: Konrad Schwarz <konrad.schwarz@siemens.com>
Date: Thu, 31 Dec 2020 22:29:47 +0100
Subject: [Buildroot] [PATCH 1/3] package/environment-setup: fix spelling of
 the script file in the manual.
In-Reply-To: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
References: <20201231212949.2415485-1-konrad.schwarz@siemens.com>
Message-ID: <20201231212949.2415485-2-konrad.schwarz@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The manual incorrectly refers to the script file as `setup-environment';
it is actually called `environment-setup'.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
 docs/manual/using-buildroot-toolchain.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 110be5939f..e202c7d09b 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -35,9 +35,9 @@ generating a tarball.
 
 For your convenience, by selecting the option
 +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP+, you can get a
-+setup-environment+ script installed in +output/host/+ and therefore
++environment-setup+ script installed in +output/host/+ and therefore
 in your SDK.  This script can be sourced with
-+. your/sdk/path/environment-setup+ to export a number of environment
++. your/sdk/path/setup-environment+ to export a number of environment
 variables that will help cross-compile your projects using the
 Buildroot SDK: the +PATH+ will contain the SDK binaries, standard
 _autotools_ variables will be defined with the appropriate values, and
-- 
2.25.4
