From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Mar 2019 14:02:07 -0700
Subject: [Buildroot] [PATCH 2/3] boot: riscv: Initial commit of OpenSBI
In-Reply-To: <20190318214630.5bc9ba71@windsurf>
References: <20190315230540.4311-1-alistair.francis@wdc.com>
 <20190315230540.4311-2-alistair.francis@wdc.com>
 <20190316084124.2dbf3e47@windsurf>
 <CAKmqyKPLkVz4nPPi_++2J=GF8n6Dzrx+RG6pZCDuhRq8oTk5LA@mail.gmail.com>
 <20190318214630.5bc9ba71@windsurf>
Message-ID: <CAKmqyKPUWDMVjkEQvmE7vzTuGjk-qG3KW7inJzMRzNLOrWkY1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 18, 2019 at 1:46 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 18 Mar 2019 13:36:53 -0700
> Alistair Francis <alistair23@gmail.com> wrote:
>
> > > So when there's no platform defined, nothing gets installed ? This
> > > looks weird.
> >
> > If no platform is defined then OpenSBI will just build a library that
> > can be used by other projects. The idea here is to allow people to
> > build that library. At the moment though nothing is using it.
>
> OK, then you can probably keep the "build without platform" thing, but
> the Config.in help text of the string option used to define the
> platform should be improved to explain what happens when no platform is
> defined.

Done! V2 sent.

Alistair

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
