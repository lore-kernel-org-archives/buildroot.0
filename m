From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Jul 2014 23:22:44 +0200
Subject: [Buildroot] autobuild-run update
Message-ID: <20140708232244.39817a4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've pushed a few updates to the autobuild-run script:

  autobuild-run: don't try to build XBMC
  http://git.buildroot.net/buildroot-test/commit/?id=8a7fc81cd82ce408e6818ad64b8ab6aab83a30c4

  autobuild-run: do not build lttng-tools with toolchains affected by PR58854
  http://git.buildroot.net/buildroot-test/commit/?id=ec03a70a7428005219e23fd4c837ac80b3988a89

  autobuild-run: do not build sdl with toolchains affected by PR60155
  http://git.buildroot.net/buildroot-test/commit/?id=9336e1725e586cd6037e7f61d25dfd089f0d13e5

I've updated the script on the Free Electrons build server with those
updates. However, while doing so, a few failed builds were generated
and are visible in the http://autobuild.buildroot.org output. It looks
like the autobuild-run script needs some improvements to handle clean
termination of builds. Contributions welcome.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
