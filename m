From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Apr 2020 23:39:18 -0600
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson.mk: set correct
 pkgconfig for native dependencies
In-Reply-To: <20200428073214.6b598767@windsurf.home>
References: <20200428040638.122494-1-james.hilliard1@gmail.com>
 <20200428072202.5889620f@windsurf.home>
 <CADvTj4oPoCyiZLt+h7Wft6eF27E-pRtOzO+68M=o5276NDRWCw@mail.gmail.com>
 <20200428073214.6b598767@windsurf.home>
Message-ID: <CADvTj4quWuWNZHd8O=xWQ6rUMAn_WXSpfwCx97dyakTnCX8wXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 27, 2020 at 11:32 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 27 Apr 2020 23:28:05 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > > Could you have a look at the patch below? My understanding is that your
> > > commit 4e0bc29993376613d200e892d491e31ea5a49622 should have made this
> > > unnecessary. Could you comment ?
> > I've confirmed with upstream that this option can only be passed via
> > command line
> > and not via cross-compilation.conf at the moment so I'm fairly confident that
> > 4e0bc29993376613d200e892d491e31ea5a49622 would not fix this issue.
>
> But then I wonder what is the point of
> 4e0bc29993376613d200e892d491e31ea5a49622 and how it can have worked ?
>
> Or is it necessary *in* addition to passing -Dbuild.pkg_config_path ?
Well I'm fairly confident -Dbuild.pkg_config_path is necessary, best I can tell
4e0bc29993376613d200e892d491e31ea5a49622 is fixing an unrelated issue.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
