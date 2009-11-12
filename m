From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Thu, 12 Nov 2009 16:19:41 +0800
Subject: [Buildroot] make saveconfig ?
In-Reply-To: <20091112085015.496ffa12@surf>
References: <9240B9AA093C4A58BEEE7BAE39B8C21A@apexjs>
	<20091111145650.4aed089e@surf>
	<48ab7e010911112017w3be898b5u76a30d601de81d78@mail.gmail.com>
	<20091112085015.496ffa12@surf>
Message-ID: <48ab7e010911120019s23db4d07h182cd0cbb1f87a03@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes.
Thanks Thomas.

2009/11/12 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Hi Kelvin,
>
> Please do not reply to me directly, but to the list instead.
>
> Le Thu, 12 Nov 2009 12:17:29 +0800,
> Kelvin Cheung <keguang.zhang@gmail.com> a ?crit :
>
> > I agree with sagaert.
> >
> > After the board support was added, we need to change and save the
> > default configs sometimes. This could be achieved by the command
> > below.
> >
> >     make BUILDROOT_LOCAL=target/device/yourcompany saveconfig
> >
> > So, I think the 'make saveconfig' is still necessary. Could you
> > reserve it ?
>
> When saveconfig is used this way, it makes sense to re-add it, that's
> right. It could be something like:
>
>  make BOARD=yourcompany/yourboard saveboardconfig
>
> Which would save: kernel configuration, uclibc configuration, busybox
> configuration, u-boot configuration to
> target/device/yourcompany/yourboard.
>
> Would this fit your needs ?
>
> Sincerly,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers and embedded Linux development,
> consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091112/df5cda97/attachment.htm>
