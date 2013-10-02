From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Oct 2013 09:13:49 +0200
Subject: [Buildroot] [RFC] package: Redownload HEAD packages every build
In-Reply-To: <OFB02446AE.7536F58C-ON86257BF7.007705C1-86257BF7.00784F1A@rockwellcollins.com>
References: <1380293015-20331-1-git-send-email-clshotwe@rockwellcollins.com>
 <20131001205154.059ec4af@skate>
 <OF074BC262.DC488FB4-ON86257BF7.006D21D1-86257BF7.006DFBEC@rockwellcollins.com>
 <20131001233739.618eb9f0@skate>
 <OFB02446AE.7536F58C-ON86257BF7.007705C1-86257BF7.00784F1A@rockwellcollins.com>
Message-ID: <20131002091349.652d110c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Tue, 1 Oct 2013 16:54:04 -0500, Ryan Barnett wrote:

> > Buildroot will rsync again the source code, and restart the build at
> > the configuration step, or the build step of the foo package.
> > 
> > Usually, /path/to/foo/sources/ will be the directory where you did your
> > Subversion checkout or Git clone of your "foo" source code.
> 
> Could you add this explanation to buildroot manual since it looks like
> <pkg>_OVERRIDE_SRCDIR mechanism is your feature and it is currently
> lacking in documentation in the manual? I too have tried to understand
> how this feature worked and it was a bit unclear.
> 
> The only mention of OVERRIDE_SRCDIR in the documentation is under the
> rebuild and reconfigure commands. Where is says that it that it only
> makes sense to use these features with OVERRIDE_SRCDIR but doesn't
> explain what you just explained above.

Right, I will submit a documentation patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
