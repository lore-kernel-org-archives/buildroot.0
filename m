From: Crane, Matthew <mcrane03@harris.com>
Date: Fri, 20 Jul 2007 16:53:00 -0400
Subject: [Buildroot] Fixdep and extra line feeds in cygwin
In-Reply-To: <20070720143902.0D57C3006F@busybox.net>
References: <20070720143902.0D57C3006F@busybox.net>
Message-ID: <E496871456016F4CA8959BE4105D2A890E8B84@troe2k1.cs.myharris.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Hi, 

Is there a patch or a simple change I can make to cause fixdep not to
create dependencies with Dos type line feeds?

This is causing the error where the extra line feeds cause macro line
continuations to have an extra line and break.

Any help much apreciated, thanks.

Matt

make[1]: Entering directory
`/usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/bu
sybox-1.6.1'
  HOSTCC  scripts/basic/split-include
  HOSTCC  scripts/basic/docproc
  SPLIT   include/autoconf.h -> include/config/*
  GEN     include/bbconfigopts.h
  HOSTCC  applets/usage
  GEN     include/usage_compressed.h
  CC      applets/applets.o
fixdep:
: No such file or directory
make[2]: *** [applets/applets.o] Error 2
make[1]: *** [applets] Error 2
