From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Mar 2019 14:24:56 -0700
Subject: [Buildroot] [PATCH v4 1/5] board/qemu/riscv32-virt: Update
 linux config
In-Reply-To: <20190319220554.79290acf@windsurf>
References: <20190319181449.25067-1-alistair.francis@wdc.com>
 <20190319220554.79290acf@windsurf>
Message-ID: <CAKmqyKMzcoR4+RfvwtyF0A3Yx9gAhHFJF-=Z9Wmt8skaE9ebug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 19, 2019 at 2:05 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Tue, 19 Mar 2019 18:15:46 +0000
> Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
> > Update the Linux defconfig. This defconfig is the in tree defconfig with
> > 32-bit support enabled.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> If it's just the in-tree defconfig + one option to enable 32-bit
> support, what about using the in-tree defconfig directly + a small
> config fragment to enable 32-bit support ?

That would be great! That's what we do in OpenEmbedded. I couldn't
figure out how to enable that though. How can I append a config to the
arch defconfig?

Alistair

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
