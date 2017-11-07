From: Martin Bark <martin@barkynet.com>
Date: Tue, 7 Nov 2017 09:17:04 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 9.0.0
In-Reply-To: <87bmkfy1cy.fsf@dell.be.48ers.dk>
References: <20171106102049.14681-1-martin@barkynet.com>
 <87k1z3y5f8.fsf@dell.be.48ers.dk>
 <CAFGQKxdp473snHnkzeCmNUhXjHXE51gEZ7v6nWmLo6YhW5pM+w@mail.gmail.com>
 <87bmkfy1cy.fsf@dell.be.48ers.dk>
Message-ID: <CAFGQKxdgGc4wSLa5uoTTz7Qt5_D9FPhucEQkyS1Pi+pHinLbtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 6 November 2017 at 13:37, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
>
> Hi,
>
> >> > +NODEJS_VERSION = 9.0.0
>  >>
>  >> Thanks. I will not bump the version for 2017.11 as I'll release -rc1
>  >> today. With 2018.02 becoming the next LTS, wouldn't it make more sense
>  >> to move to 8.9.0 instead?
>  >>
>  >> https://nodejs.org/en/blog/release/v8.9.0/
>
>  > When we discussed this in the past it was decided to track the latest
>  > version of nodejs.  This simplified buildroot to only support one
> version
>  > of nodejs.  The release schedule of buildroot and nodejs don't really
> align
>  > so what you're saying in practice means we would have to only track the
> LTS
>  > versions of node (the even version numbers).
>
> What I'm saying is that there is a tradeoff. If we move to the 9.x
> version for the 2018.02 release then we'll have to migrate to 10.x quite
> soon during the LTS period to get bug/security fixes - Which isn't
> really nice.
>
> We may move to 9.x for the 2018.05 release if there's a good reason for
> it (I wouldn't know, I don't use nodejs), but again it means extra
> effort for the LTS as fixes from master cannot simply be cherry picked -
> E.G. you haven't submitted any nodejs version bumps for the 2017.02.x
> series.
>
> Do these odd non-LTS releases bring a lot of new features making it
> worth the extra effort?
>

They can do, it varies.  It really just depends what major changes are
queued up.  Major releases can include breaking changes e.g. API changes

I can see arguments for following only LTS, only latest or both.  I guess
all i need is a final decision to be made.

We don't have to solve this right now.  How about i submit an 8.9.0 patch.

Thanks

Martin



>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171107/f9a7c4b6/attachment.html>
