From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 3 Dec 2019 12:07:51 +0200
Subject: [Buildroot] [FYI] Bootlin external toolchains
In-Reply-To: <a9c40802-dfd5-67b5-6750-b0711f667280@smile.fr>
References: <CAMw6YJLJae0GcmrDmSY8FZ-uMj+WBybPkBaLQC1wkhooCjoKyQ@mail.gmail.com>
 <20191202152601.4ab1c8cd@windsurf>
 <a9c40802-dfd5-67b5-6750-b0711f667280@smile.fr>
Message-ID: <CAMw6YJKQ-Su+nKYJo3YZyEo5XxdgPEpdj-D22psgqib2dwnv_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

On Tue, Dec 3, 2019 at 11:59 AM Romain Naour <romain.naour@smile.fr> wrote:
>
> Hi Thomas, Vadim,
>
> +Arthur Courtel in Cc.
>
> Le 02/12/2019 ? 15:26, Thomas Petazzoni a ?crit :
> > Hello,
> >
> > +Romain Naour in Cc.
> >
> > On Mon, 2 Dec 2019 02:47:15 +0200
> > Vadim Kochan <vadim4j@gmail.com> wrote:
> >
> >> Just in case if someone will be interested. I started Buildroot external
> >> project which provides external toolchains from the Bootlin:
> >>
> >>     https://toolchains.bootlin.com
> >>
> >> The git repo can be found at:
> >>
> >>     https://github.com/vkochan/buildroot-external-toolchain-bootlin
> >
> > An effort was started to package the Bootlin external toolchains in
> > Buildroot itself, some time ago by engineers at Smile. We had some
> > off-list discussion about this, but I don't think it was ever posted to
> > the list. The idea back then was to have a script that generates all
> > the packages, but the design was to have one package for each
> > toolchain, so it really added a lot of packages.
> >
> > But I think we should really support these toolchains in Buildroot
> > proper instead of having an external for them.
>
> Agree.
>
> Arthur will take a look at the script but it's very complicated script...
> Maybe we need to discuss what we really want.
>
> Best regards,
> Romain

May be it would be good to start with generic script which generates
br2_fragment by specifying the path to the toolchain ?

Regards,
Vadim Kochan
