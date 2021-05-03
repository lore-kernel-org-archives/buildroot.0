From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 May 2021 17:11:09 +1000
Subject: [Buildroot] [PATCH v2 3/6] package/riscv64-elf-toolchain: new
 package
In-Reply-To: <20210503085446.0af5e624@windsurf>
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-11-thomas.petazzoni@bootlin.com>
 <CAKmqyKMXQuq0UVLMH6AL2hiHLW8p0cHLLtkzeSqZo6Y+V=WgPw@mail.gmail.com>
 <20210503085446.0af5e624@windsurf>
Message-ID: <CAKmqyKPC-1+dcF11hPnU4weF41EwpwR+iZL4KprftbsojOe23Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 3, 2021 at 4:54 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 3 May 2021 10:14:38 +1000
> Alistair Francis <alistair23@gmail.com> wrote:
>
> > > +RISCV64_ELF_TOOLCHAIN_VERSION = 2020.12.8
> > > +RISCV64_ELF_TOOLCHAIN_SITE = https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12
> >
> > Could we not get an official GCC build instead of SiFives custom toolchain?
>
> What do you call an "official GCC build" ? A toolchain built by
> Buildroot from source ? Buildroot can only build a single toolchain,
> which is Linux capable. Buildroot does not know how to build a separate
> bare-metal toolchain, which is why in such situations we use an
> existing pre-compiled toolchain.

I just meant something from upstream GCC and not a vendor.

Alistair

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
