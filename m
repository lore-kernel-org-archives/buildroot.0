From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 11 Aug 2011 19:32:50 +0200
Subject: [Buildroot] $udevroot
In-Reply-To: <4E43EE96.1020405@visionsystems.de>
References: <1313073148.31365.9.camel@sven> <4E43EE96.1020405@visionsystems.de>
Message-ID: <1313083971.12036.10.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-08-11 at 17:00 +0200, Yegor Yefremov wrote:

> > we are facing some problems with device nodes since the udev update. Now
> > I am trying to understand how the whole device management works
> > nowadays.
> 
> What problems are you facing?

Well, I went with the default of using a static device table and
obviously I need to add some device files that are otherwise missing.
But I'll now to try to use udev instead.


Thanks,
Sven
