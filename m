From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Apr 2012 21:21:38 +0200
Subject: [Buildroot] [PATCH] Add libapr-package
In-Reply-To: <000301cd21fd$3941aba0$abc502e0$@com>
References: <1334673316-28944-1-git-send-email-bachmann@tofwerk.com>
 <201204211458.06684.arnout@mind.be> <000301cd21fd$3941aba0$abc502e0$@com>
Message-ID: <201204272121.38840.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 24 April 2012 11:32:52 Rico Bachmann wrote:
> >  One last suggestion for next time you make a patch: you can add the
> > log of the history of your patch directly in the commit message, below
> > a line with three dashes, like this:
> > 
> > Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
> > ---
> > v3: Rename from libapr to apr
> > v2: ...
> 
> I'll try that with my new patch for apr-util.
> How can I add my history when I have to do a git rebase -I master?
> 
> Because I can't see my history in the patch after a fixup with git rebase.
> 
> Do I have to add them manually?

 Indeed, git rebase is the same as applying the patch from a mail...  You
can either fix up the commit message manually, or use something like 
topgit to manage your patch queues.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
