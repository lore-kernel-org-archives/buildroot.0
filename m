From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Jun 2018 15:24:09 +0200
Subject: [Buildroot] [PATCH 1/1] adding-packages-cargo.txt: remove
 host-cargo select
In-Reply-To: <20180610150115.07ed9688@windsurf>
References: <20180607180327.12308-1-fontaine.fabrice@gmail.com>
 <20180610150115.07ed9688@windsurf>
Message-ID: <CAPi7W81uHA-7crBqbFs2vJ4Y-UDsEog8s0_dGXF=XZQtN7b1uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-06-10 15:01 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Thu,  7 Jun 2018 20:03:27 +0200, Fabrice Fontaine wrote:
> > Remove select BR2_PACKAGE_HOST_CARGO from Config.in
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> In fact, I don't agree with this change. Cargo packages are going to
> use host-cargo, so it makes sense for them to select.
>
> Today, it is not mandatory for a host package to be selected at the
> Config.in level to have it built, and we don't enforce this. But it is
> actually more logical to do it, and in line with our long-term idea of
> having Config.in options for all host packages.
>
> So, in fact I prefer your original patch, and I disagree with Baruch
> statement that we shouldn't do the select. Yes, it is not /needed/, but
> it is more correct with the select.
>
OK, so I will send a v3 of my patch's serie.

>
> Best regards,
>
> Thoms
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180610/daa33b6c/attachment.html>
