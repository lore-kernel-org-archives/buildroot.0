From: daggs <daggs@gmx.com>
Date: Sat, 25 Jun 2016 08:37:18 +0200
Subject: [Buildroot] [PATCH 3/4 v3] libamcodec: New Package
In-Reply-To: <CALAjcgXpqh74h_6gc+Z8rjZwa_VW4=Wzw5fLDvpjodvM2n+Qmg@mail.gmail.com>
References: <20160624182256.11909-1-daggs@gmx.com>
 <20160624182256.11909-3-daggs@gmx.com>,
 <CALAjcgXpqh74h_6gc+Z8rjZwa_VW4=Wzw5fLDvpjodvM2n+Qmg@mail.gmail.com>
Message-ID: <trinity-25f18a16-8c5d-4cf2-91ae-8deff69c440d-1466836638810@3capp-mailcom-bs05>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> 
> On Fri, Jun 24, 2016 at 2:22 PM, Dagg Stompler <daggs@gmx.com> wrote:
> > v2 -> v3:
> >  - fix sum256 value.
> >  - fix patch.
> 
> While I don't believe it's required, I recommending leaving old change
> version information in new patches as well. This helps reviewers who
> jump in late so understand your patch changes easier. For example,
> patch 613857 [2].
> 
> > +Subject: [PATCH] libamcodec: fix makefiles to allow cross compilation.
> > +
> > +fix makefiles so it will be possible to cross compile the package
> > +
> > +Signed-off-by: Dagg Stompler <daggs@gmx.com>
>
will take into account.
 
> Out of curiosity, have you also tried submitting these changes
> upstream? I don't see any forks or pull requests on
> "mdrjr/c2_aml_libs" [2] (if they even handle community patches that
> way). I might help the long term maintenance of this package in
> Buildroot by fixing issues in the root projects (instead of having to
> update patches every version/hash bump).
>
I didn't tried that, I can try sending patches to the maintainer of this repo.
will ask him on the msg boards. 
> > +LIBAMCODEC_SITE = $(call github,mdrjr,c2_aml_libs,$(LIBAMCODEC_VERSION))
> 
> I haven't really dug into the origin of the libamcodec package, but is
> there a reason why "mdrjr/c2_aml_libs" [2] is being used over (which
> may be the official) "Stane1983/amlogic-libplayer" repository?
> 
I don't know what is the diff but the maintaier forked it so I assume that this version works 100% on the board.
> > +LIBAMCODEC_LICENSE = Unclear
> 
> Providing "unclear" is not an acceptable license choice. You need to
> find the exact license for this package before anyone would submit it
> into Buildroot (although, I'm not maintainer, so I couldn't stop them
> if they wanted to add it anyways :D).
> 
if you look on previous mails on this matter you will see that Thomas suggested it as the license isn't clear yet.
I've contacted the maintainer and asked for license clarification but beside ack that he got my msg and will pass it alone.
I'll try to contact him again.

> [1]: https://patchwork.ozlabs.org/patch/613857/
> [2]: https://github.com/mdrjr/c2_aml_libs
> [3]: https://github.com/Stane1983/amlogic-libplayer

Dagg.
