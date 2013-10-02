From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Wed, 2 Oct 2013 13:34:05 -0500
Subject: [Buildroot] [RFC] package: Redownload HEAD packages every build
In-Reply-To: <20131002091349.652d110c@skate>
References: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>	<20131001205154.059ec4af@skate>
 <OF074BC262.DC488FB4-ON86257BF7.006D21D1-86257BF7.006DFBEC@rockwellcollins.com>
 <20131001233739.618eb9f0@skate>	<OFB02446AE.7536F58C-ON86257BF7.007705C1-86257BF7.00784F1A@rockwellcollins.com>
 <20131002091349.652d110c@skate>
Message-ID: <OFC0CCA765.968A2DC7-ON86257BF8.0065C6C6-86257BF8.0065F2C5@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 10/02/2013 
02:13:49 AM:

> > > Buildroot will rsync again the source code, and restart the build at
> > > the configuration step, or the build step of the foo package.
> > > 
> > > Usually, /path/to/foo/sources/ will be the directory where you did 
your
> > > Subversion checkout or Git clone of your "foo" source code.
> > 
> > Could you add this explanation to buildroot manual since it looks like
> > <pkg>_OVERRIDE_SRCDIR mechanism is your feature and it is currently
> > lacking in documentation in the manual? I too have tried to understand
> > how this feature worked and it was a bit unclear.
> > 
> > The only mention of OVERRIDE_SRCDIR in the documentation is under the
> > rebuild and reconfigure commands. Where is says that it that it only
> > makes sense to use these features with OVERRIDE_SRCDIR but doesn't
> > explain what you just explained above.
> 
> Right, I will submit a documentation patch.

This sounds like a much better method for my development.  Thanks for 
explaining it.

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131002/1353fa91/attachment.html>
