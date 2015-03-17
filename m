From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 18:01:35 +0100
Subject: [Buildroot] Autobuild news: config.log files now available
Message-ID: <20150317180135.2d377f1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This WE, I've finally taken the time to review, test and merge the
patches from Thomas DS on the autobuild-run script.

One of the cool new feature brought by his patches is that now the
config.log file(s) from the failed package are automatically uploaded
as part of the build results. Those files typically contain a lot of
useful information to diagnose the reason of the build failure, at
least for autoconf based packages.

See
http://autobuild.buildroot.org/results/31d/31d332cf2c043b50f2e4bb0b358c28e3701a6547//php-5.5.22/config.log
for an example.

Right now, this is only done for the build results coming from my
autobuilders, but I've asked Peter, Julien and Richard to update their
autobuilder scripts as well, so the results coming from their machine
should soon get this additional info as well.

Thanks to Thomas DS for implementing this feature!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
