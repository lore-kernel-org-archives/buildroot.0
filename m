From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 May 2021 09:13:24 +0200
Subject: [Buildroot] [PATCH v2 3/6] package/riscv64-elf-toolchain: new
 package
In-Reply-To: <CAKmqyKPC-1+dcF11hPnU4weF41EwpwR+iZL4KprftbsojOe23Q@mail.gmail.com>
References: <20210502212141.934384-1-thomas.petazzoni@bootlin.com>
 <20210502212141.934384-11-thomas.petazzoni@bootlin.com>
 <CAKmqyKMXQuq0UVLMH6AL2hiHLW8p0cHLLtkzeSqZo6Y+V=WgPw@mail.gmail.com>
 <20210503085446.0af5e624@windsurf>
 <CAKmqyKPC-1+dcF11hPnU4weF41EwpwR+iZL4KprftbsojOe23Q@mail.gmail.com>
Message-ID: <20210503091324.7c750501@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 3 May 2021 17:11:09 +1000
Alistair Francis <alistair23@gmail.com> wrote:

> > What do you call an "official GCC build" ? A toolchain built by
> > Buildroot from source ? Buildroot can only build a single toolchain,
> > which is Linux capable. Buildroot does not know how to build a separate
> > bare-metal toolchain, which is why in such situations we use an
> > existing pre-compiled toolchain.  
> 
> I just meant something from upstream GCC and not a vendor.

But where is "upstream GCC" providing pre-compiled bare-metal toolchains?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
