From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Dec 2012 09:16:40 +0100
Subject: [Buildroot] [PATCH] libglib2: don't try to use
 DTrace/GCov/SystemTap for host build
In-Reply-To: <20121209192619.GB3880@tarshish>
References: <1355080604-27155-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20121209192619.GB3880@tarshish>
Message-ID: <20121210091640.1e687c54@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 9 Dec 2012 21:26:20 +0200, Baruch Siach wrote:

> On Sun, Dec 09, 2012 at 08:16:44PM +0100, Thomas Petazzoni wrote:
> > We really only need the host build of libglib2 for a few helper
> > programs that are used for the target build of libglib2. Therefore,
> > trying to use bells and whistles like DTrace, GCov and SystemTap is
> > useful.
> 
> Not?

Yes, thanks, I've sent a v2 that fixes that.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
