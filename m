From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 09:39:46 +0100
Subject: [Buildroot] [PATCH v2 5/7] package/freescale-imx/imx-gpu-viv:
 bump to version 6.4.0.p1.0
In-Reply-To: <CAMWBNu68n60JO5X1rUxnb5TD1RvV9FqeghtPLttJSHExkUy3gQ@mail.gmail.com>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
 <20200203193155.12657-5-tuzakli.refik@gmail.com>
 <20200204231052.350677e5@windsurf>
 <CAMWBNu68n60JO5X1rUxnb5TD1RvV9FqeghtPLttJSHExkUy3gQ@mail.gmail.com>
Message-ID: <20200205093946.273d5b36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Refik,

Please keep the Buildroot mailing list in Cc when replying. Thanks!

On Wed, 5 Feb 2020 10:51:28 +0300
Refik Tuzakli <tuzakli.refik@gmail.com> wrote:

> X11 and fb backend do not support on i.MX 8 series. Only wayland and
> xwayland are supported. Thus there is no libGL-fb.so. I guess there must
> not be X11 backend. I suggest that X11 and fb support should be disabled
> for imx8 or 64 bit vivante GPU support. 32bit vivante GPU support has
> libGL-fb.so. .mk file is fine for 32bit but it must be adopted for 64bit
> support.

Hm, OK. Could you send follow-up patches improving that, with detailed
explanations in the commit log ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
