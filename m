From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Aug 2012 01:28:32 +0200
Subject: [Buildroot] [PATCH] grub: add host support
In-Reply-To: <20120825102258.3ba3a0dd@skate>
References: <1345042674-28463-1-git-send-email-rbraun@sceen.net>
 <20120825102258.3ba3a0dd@skate>
Message-ID: <503AB120.4090909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/25/12 10:22, Thomas Petazzoni wrote:
> Since you had a look some time ago at Grub (and the problem of building
> it on x86-64), could you have a look at the below proposal from Richard?
>
> Richard proposes to add a host variant of Grub. At some point, I think
> we discussed changing the target variant so that it gets built with the
> host compiler (since Grub is always built for x86/x86-64 systems).
>
> With Richard's proposal below, I'm a bit worried about the fact that
> the user needs to do "make host-grub" manually. Of course, we can add
> the host-grub package for the "Host utilities" menu. But anyway, I want
> your opinion on this.

  Yeah, that got pushed down a little on my todo list.  I was in fact looking
into grub2 to see if that's any better for cross-compilation.  But that's
almost two months ago...

  Having the possibility to compile a host-grub is a good start in any case,
however.  We can still remove it again if we decide to always do native
compilation for grub.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
