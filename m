From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Mar 2012 01:15:00 +0200
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.4p4
In-Reply-To: <20120329154644.B0407969A7@busybox.osuosl.org>
References: <20120329154644.B0407969A7@busybox.osuosl.org>
Message-ID: <20120330011500.07b6e26b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 29 Mar 2012 17:46:25 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> commit: http://git.buildroot.net/buildroot/commit/?id=61d3d740dba46f469ea368b9080091ce614455a8
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

I don't know if it is caused by this bump version or if the problem was
present before, but:

 http://autobuild.buildroot.org/results/d5a7831701e4c3b147451f4f021aa644672005ae/build-end.log
 http://autobuild.buildroot.org/results/521b2a317fe2464c13e6fecd0c80ee2bac229522/build-end.log
 http://autobuild.buildroot.org/results/10469a7a62f43200e17d94fcb0460f2e032bac4d/build-end.log

I don't think I have seen sudo build failures before this bump through
the autobuild tests.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
