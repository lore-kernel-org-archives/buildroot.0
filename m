From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 1 Oct 2019 08:03:22 +0200
Subject: [Buildroot] [PATCH 0/2] Add support for the D programming
 language
In-Reply-To: <20190930230356.477cf089@windsurf.home>
References: <20190929165601.20269-1-eric.le.bihan.dev@free.fr>
 <20190930230356.477cf089@windsurf.home>
Message-ID: <20191001060322.GB31145@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-09-30 23:03, Thomas Petazzoni wrote:
> Hello Eric,
>
> On Sun, 29 Sep 2019 18:55:59 +0200
> Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:
>
> > This small series add supports for the D programming language, available in
> > GCC since version 9.1.
> >
> > Eric Le Bihan (2):
> >   toolchain: add support for D language
> >   package/gcc: add support for D language
>
> Could you also add support for supporting an external toolchain that provides the D language ? It's mainly a matter of:
>
>  - tweaking the external toolchain code to copy the right libraries
>
>  - adding a blind Config.in option to indicate that the external
>    toolchain provides D language support
>
>  - adding a visible Config.in options in the custom external toolchain
>    package to ask the user if the toolchain provides D language support
>
>  - a check to verify that if the user has declared the toolchain as
>    supporting the D language, it is really supported

Given that traditional external toolchain providers do not ship
D-capable toolchains yet, I'll try using a toolchain generated with
crosstool-ng.

Regards,

--
ELB
