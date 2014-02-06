From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Feb 2014 21:58:35 +0100
Subject: [Buildroot] autobuild.buildroot.org site improvement
Message-ID: <20140206215835.537252b7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

It was requested during the Buildroot meeting, and Ryan reminded me
about it right now, so I took five minutes to implement it: filtering
of autobuilder results by failed package.

See:

  http://autobuild.buildroot.org/?reason=vlc-2.1.2

It only shows failures, because the autobuilder is not able to find out
whether vlc-2.1.2 was built successfully as part of other builds. We
could do this only if the user provides the corresponding Kconfig
option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
