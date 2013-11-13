From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Wed, 13 Nov 2013 08:11:52 -0600
Subject: [Buildroot] [PATCH 1/1] omniorb: add COS Naming Service
In-Reply-To: <CAAXf6LXBq95Fnek3MgjK0D2GBSUKjJkwZ8pwObRuMfQNKsoAaQ@mail.gmail.com>
References: <1384288305-4945-1-git-send-email-mlweber1@rockwellcollins.com>	<9e8746c1-8e33-4c55-b4e2-b2b1e6181f86@email.android.com>
 <87txfh2r91.fsf@dell.be.48ers.dk>	<CAAXf6LWs9vXKEOQ7Pt2yteLnGHVsuNEJczVaR2AnwnCRwfbjyw@mail.gmail.com>
 <87txfg1vhu.fsf@dell.be.48ers.dk>
 <CAAXf6LXBq95Fnek3MgjK0D2GBSUKjJkwZ8pwObRuMfQNKsoAaQ@mail.gmail.com>
Message-ID: <OFE25F15E6.05DABC37-ON86257C22.004DC720-86257C22.004DFDBA@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 11/13/2013 
03:59:43 AM:

> From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> To: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Matt Weber <mlweber1@rockwellcollins.com>, buildroot 
> <buildroot@busybox.net>
> Date: 11/13/2013 03:59 AM
> Subject: Re: [PATCH 1/1] omniorb: add COS Naming Service
> 
> On Wed, Nov 13, 2013 at 10:50 AM, Peter Korsgaard <jacmet@uclibc.org> 
wrote:
> >>>>>> "Thomas" == Thomas De Schampheleire 
> <patrickdepinguin@gmail.com> writes:
> >
> > Hi,
> >
> >> Yuk, that's a pity...
> >> In this case my preference is to have the comment before the main
> >> option (so as close as possible), rather than after all sub options.
> >
> >> What is your opinion?
> >
> > I don't have a stong opion about it, but that's fine by me as well. 
For
> > simple packages (most), it imho is a bit more logical to have it after
> > the option though (and it's what we are currently doing most places).
> >
> 
> As long as there are no suboptions that is indeed more logical.
> However, when suboptions are added the comment moves down, and
> depending on where new suboptions are added this may not be apparent
> from the diff output alone. So one way is to use one 'rule' which
> would be the comment above, or we keep simple packages without
> suboptions with the comment below, and make sure the comment is moved
> to the top when suboptions are added. The first alternative is easier
> to maintain, but less beautiful for the simple packages without
> suboptions.
> 
> If I had to pick, I'd pick the first alternative, for easier
> maintainability and uniformity.
I agree, I would have liked to keep it right below the main option,
but above is a reasonable location, since if it was placed below all 
suboptions I could see it get confusing.

Thanks,
Matt

> 
> Best regards,
> Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131113/fa8f7234/attachment.html>
