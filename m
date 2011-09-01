From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2011 18:18:51 +0200
Subject: [Buildroot] [git commit] initramfs: fix boot with dynamic /dev
In-Reply-To: <20110901091842.784dbcf3@skate>
References: <20110720150418.E95188B391@busybox.osuosl.org>
 <201108240953.23168.arnout@mind.be> <20110901091842.784dbcf3@skate>
Message-ID: <201109011818.52413.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Thursday 01 September 2011 09:18:42, Thomas Petazzoni wrote:
> >  - Clearly this should be refactored so we don't duplicate the same
> >
> > stuff in initramfs.mk and cpio.mk.
> 
> In fact I think the initramfs.mk and cpio.mk should be merged. Instead
> of having initramfs.mk generating the "initramfs file list", we could
> just have cpio.mk generate the cpio archive and then have the kernel
> configuration tuned to include this cpio archive as an initramfs. I
> haven't thought too much about the details of this but I remember we
> already discussed this in the past and it's probably doable.

 That actually sounds simpler than the way it's done now :-)

 If I find the time, I'll take a look at it.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
