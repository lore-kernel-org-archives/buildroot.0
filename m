From: Rico Bachmann <bachmann@tofwerk.com>
Date: Tue, 24 Apr 2012 11:32:52 +0200
Subject: [Buildroot] [PATCH] Add libapr-package
In-Reply-To: <201204211458.06684.arnout@mind.be>
References: <1334673316-28944-1-git-send-email-bachmann@tofwerk.com>
 <201204211458.06684.arnout@mind.be>
Message-ID: <000301cd21fd$3941aba0$abc502e0$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Urspr?ngliche Nachricht-----
> Von: Arnout Vandecappelle [mailto:arnout at mind.be]
> Gesendet: Samstag, 21. April 2012 14:58
> An: buildroot at busybox.net
> Cc: Rico Bachmann
> Betreff: Re: [Buildroot] [PATCH] Add libapr-package
> 
> On Tuesday 17 April 2012 16:35:15 Rico Bachmann wrote:
> >
> > Add libapr-package
> > rename from libapr to apr
> > rename all values and arguments from libapr into apr change
> > package/Config.in from libapr to apr add the other small changes from
> > mailinglist
> 
>  Hoi Rico,
> 
>  Thanks for your persistence in correcting your patch until it was
> perfect!
> 
>  One last suggestion for next time you make a patch: you can add the
> log of the history of your patch directly in the commit message, below
> a line with three dashes, like this:
> 
> Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
> ---
> v3: Rename from libapr to apr
> v2: ...

I'll try that with my new patch for apr-util.
How can I add my history when I have to do a git rebase -I master?

Because I can't see my history in the patch after a fixup with git rebase.

Do I have to add them manually?

> 
> 
>  When the patch is applied to git, the part below the --- will be
> removed, so you can also add other random comments in there.
> 
>  And also, you can add the version number when sending the patch like
> this:
> 
> git send-email --subject-prefix='PATCH v2' ...

I'll try that if I need a v2 from my next patch.

> 
> 
>  Regards,
>  Arnout
> 
> 
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

Thanks for the hints!

Regards
Rico

Tofwerk AG, Rico Bachmann
+41 33 511 11 69
bachmann at tofwerk.com
http://www.tofwerk.com
Uttigenstrasse 22
CH - 3600 Thun
