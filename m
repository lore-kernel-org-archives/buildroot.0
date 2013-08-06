From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Aug 2013 12:22:46 +0200
Subject: [Buildroot] Buildroot and NOMMU
In-Reply-To: <38F83949ED76A946BE17B6F2F98F362E0DA60D@MX33.campus.intern>
References: <38F83949ED76A946BE17B6F2F98F362E0DA4F3@MX33.campus.intern>
 <38F83949ED76A946BE17B6F2F98F362E0DA5D1@MX33.campus.intern>
 <20130806105928.41ed18f2@skate>
 <38F83949ED76A946BE17B6F2F98F362E0DA60D@MX33.campus.intern>
Message-ID: <20130806122246.7bf1140e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pl?ss Tobias TA.E.1001,

Please keep the Buildroot list in Cc.

On Tue, 6 Aug 2013 09:16:51 +0000, Pl?ss Tobias TA.E.1001 wrote:

> thank you for the information! I would like to help improve things
> concerning this subject, if I could do any things, let me know. I'm
> very interested in this, since I have some selfmade ARM boards where
> it would be really interesting to run Linux on; but, as they don't
> have an MMU, I need uClibc, BusyBox and of course Buildroot, all of
> them with NOMMU support.

Well, someone needs to look into those issues and find the solutions. I
can certainly cook some patches, but I don't have a hardware platform
to test things on. If you're willing to do some testing+debugging, then
we could try to work together on this.

But I'd like first to hear about the status of Gustavo's work, as I'd
prefer to avoid duplicating his work.

> When I searched the internet, I found various sites concerning
> uCLinux on ARM, even with uCLibc. Since it is uCLinux, it must be
> without MMU, but, however, I was not able to find *anything* about
> where these people have the NOMMU uClibc from :-) But of course it
> would be really nice if it was possible from within Buildroot, using
> only standard tools and no patches, to get a NOMMU build.

Most likely from uClinux-dist, which has been for a while the reference
Linux distribution for noMMU platforms. Unfortunately, it is no longer
that well maintained.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
