From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 9 Jul 2013 10:34:32 -0500
Subject: [Buildroot] [PATCH 2/2] beagle-capes: new package
In-Reply-To: <20130708174739.GD3206@free.fr>
References: <1373239866-18076-1-git-send-email-spenser@gillilanding.com>
 <1373239866-18076-2-git-send-email-spenser@gillilanding.com>
 <20130708174739.GD3206@free.fr>
Message-ID: <CAEBucnCRUZg_n7PgP6NaM6Y7dUsoTv0xW9Y-22s4ct0vEfw=EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

> I know it was me suggesting this new package, but in the end, wouldn't
> this be better handled with a post-build script?

If it's handled with a post script; then the kconfig option for
installing firmware would need to be visible to the user.

> A post-build script would also have all lattitude to decide what exact
> .dtbo files to copy over, not just everything.
>
> Not saying we should drop this package, but there really are a few
> options here, and I don't really know what's better.
>
> Alphabetical order, please.

Will fix.

> The comment is mis-leading: the firmware files are not copied from the
> kernel source tree, but from staging. I would not state where they are
> copied from, so I'd say something along those lines:
>
>     Install BeagleBone capes firmwares.
>
>     These firmwares are bundled in the TI fork on the Linux kernel for
>     the BegaleBone, so you'll need to configure Buildroot to use such a
>     kernel.

Will fix.

>> +
>> +comment "requires the linux kernel"
>
> comment "beagle-capes requires a Linux kernel"

Will fix.

Thanks,
Spenser


--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
