From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 23:30:37 +0200
Subject: [Buildroot] [PATCH v1 1/1] rtl8821au: new package
In-Reply-To: <CA+h8R2rH2Ne_PUe85wMnEc1a817FVun0m61z+FqCfA3ph5NvMQ@mail.gmail.com>
References: <1436914861-10912-1-git-send-email-christian@paral.in>
 <20150718232609.5828891c@free-electrons.com>
 <CA+h8R2rH2Ne_PUe85wMnEc1a817FVun0m61z+FqCfA3ph5NvMQ@mail.gmail.com>
Message-ID: <20150720233037.1a9da56a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian,

Please do not reply to me directly, keep the list in Cc. Thanks.

On Mon, 20 Jul 2015 20:55:09 +0000, Christian Stewart wrote:

> I didn't see the kernel module infrastructure before, not really sure how I
> missed it. I remember looking closely at the manual.

The kernel module infra is brand new, it was merged like 10 days ago.

> I put it under linux-firmware because I thought that was where all of the
> wifi related drivers should go. But I think you're right that it should be
> separate.

Yes, it's not a firmware per-se.

> The reason why I'm using my version of the driver is because it's based on
> an entirely different wifi driver release from the other repository you've
> linked. Mine is based on v4.3.14_13455.20150212_BTCOEX20150128-51 while
> theirs is based on a version from a couple years ago. Thus mine is actually
> closer to the vendor version, with some fixups.
> 
> Is it okay to use this version?

I suppose it's not possible to directly download the vendor version?

If not, then using your Github repo is probably OK. The issue is of
course that in 6-12 months, you'll probably stop caring about this
driver, and no-one will be able to upstream fixes anymore. But I guess
that's the normal life-cycle for out of tree kernel drivers,
unfortunately.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
