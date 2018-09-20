From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 23:10:58 +0200
Subject: [Buildroot] [PATCH 02/14] boot/at91bootstrap: URL update
In-Reply-To: <CANQCQpa_4vmfdei0QacdPOiPXFVouWQcvjJZ1=94Jy3n0_+C4Q@mail.gmail.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-2-git-send-email-matthew.weber@rockwellcollins.com>
 <20180920221259.72b5b016@windsurf>
 <CANQCQpa_4vmfdei0QacdPOiPXFVouWQcvjJZ1=94Jy3n0_+C4Q@mail.gmail.com>
Message-ID: <20180920231058.58662563@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 15:35:14 -0500, Matthew Weber wrote:

> > > diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
> > > index 0f6430f..3d649b1 100644
> > > --- a/boot/at91bootstrap/Config.in
> > > +++ b/boot/at91bootstrap/Config.in
> > > @@ -10,6 +10,8 @@ config BR2_TARGET_AT91BOOTSTRAP
> > >         - Physical media algorithm such as DataFlash, NandFlash, NOR
> > >           Flash...
> > >
> > > +       https://www.at91.com/linux4sam/bin/view/Linux4SAM/LegacyAT91Bootstrap  
> >
> > Actually, this one should use:
> >
> >           https://www.at91.com/linux4sam/bin/view/Linux4SAM/LegacyAT91Bootstrap
> >  
> 
> Ok so this patch is ok then

Ah, yes, my bad, sorry :-/

> and for the at91dataflashboot I found it mentioned on the same legacy
> page but it definitely is a weak reference.

I sent an e-mail to Atmel^WMicrochip people about at91dataflashboot,
we'll see what they have to say.

> > Perhaps your script should support a way of specifying "yeah, there
> > is no upstream location" in an explicit way.  
> 
> Is that maybe a string we put in the end of the help section?   "No
> Upstream URL"

Yes, I was thinking about something like that.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
