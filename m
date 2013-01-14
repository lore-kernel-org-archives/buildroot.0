From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 23:51:40 +0100
Subject: [Buildroot] [PATCH] webkit: fix compilation without X11
In-Reply-To: <1356681885-4123-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Fri, 28 Dec 2012 09:04:45 +0100")
References: <1356681885-4123-1-git-send-email-sho@relinux.de>
Message-ID: <87a9sbnzsz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Fixes:
 Stephan>  http://autobuild.buildroot.net/results/86534588d192fe1515ce520c109e884864871d94/
 Stephan> and others.

 Stephan> Webkit includes X11 headers even when configuerd for DirecfFB, because
 Stephan> the test within GNUmakefile.in does not work properly. Autoreconfigure
 Stephan> fails because of incompatibility with buildroot's autotools version.

 Stephan> For now a patch for GNUmakefile.in fixes this problem.

 Stephan> Since webkit release is quite old it doesn't seem to be worth
 Stephan> doing more, on the long run we should bump the version.

Indeed. Committed, thanks.

-- 
Bye, Peter Korsgaard
