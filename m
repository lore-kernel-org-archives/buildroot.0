From: Konrad Schwarz <konrad.schwarz@siemens.com>
Date: Sun,  3 Jan 2021 18:29:54 +0100
Subject: [Buildroot] [PATCH 4/4] package/environment-setup: fix spelling of
 the script file in the manual.
In-Reply-To: <20201231212949.2415485-2-konrad.schwarz@siemens.com>
References: <20201231212949.2415485-2-konrad.schwarz@siemens.com>
Message-ID: <20210103172955.2424617-1-konrad.schwarz@siemens.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My previous patch of the same name was erroneous;
the name of the setup file was actually spelled correctly
in one of two instances, and reversed in the other;
I mistakingly reversed the order in both instances.

Signed-off-by: Konrad Schwarz <konrad.schwarz@siemens.com>
---
Interdiff:
  diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
  index e202c7d09b..09408ef05a 100644
  --- a/docs/manual/using-buildroot-toolchain.txt
  +++ b/docs/manual/using-buildroot-toolchain.txt
  @@ -37,7 +37,7 @@ For your convenience, by selecting the option
   +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP+, you can get a
   +environment-setup+ script installed in +output/host/+ and therefore
   in your SDK.  This script can be sourced with
  -+. your/sdk/path/setup-environment+ to export a number of environment
  ++. your/sdk/path/environment-setup+ to export a number of environment
   variables that will help cross-compile your projects using the
   Buildroot SDK: the +PATH+ will contain the SDK binaries, standard
   _autotools_ variables will be defined with the appropriate values, and

 docs/manual/using-buildroot-toolchain.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index e202c7d09b..09408ef05a 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -37,7 +37,7 @@ For your convenience, by selecting the option
 +BR2_PACKAGE_HOST_ENVIRONMENT_SETUP+, you can get a
 +environment-setup+ script installed in +output/host/+ and therefore
 in your SDK.  This script can be sourced with
-+. your/sdk/path/setup-environment+ to export a number of environment
++. your/sdk/path/environment-setup+ to export a number of environment
 variables that will help cross-compile your projects using the
 Buildroot SDK: the +PATH+ will contain the SDK binaries, standard
 _autotools_ variables will be defined with the appropriate values, and
-- 
2.25.4
