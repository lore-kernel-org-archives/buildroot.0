From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 09:28:18 +0200
Subject: [Buildroot] [PATCH] mediastreamer: fix build with libX11 and
 sdl without x11 support
In-Reply-To: <1343036959-7639-1-git-send-email-jacmet@sunsite.dk>
References: <1343036959-7639-1-git-send-email-jacmet@sunsite.dk>
Message-ID: <20120724092818.3b407317@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 23 Jul 2012 11:49:19 +0200,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> Fixes http://autobuild.buildroot.net/results/a8f2db4a40c0f53c0d25b2632fe87c2ce136f770
> 
> Mediastreamer assumes SDL has X11 support if SDL and libX11 are found,
> which is not necessarily true in BR.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
