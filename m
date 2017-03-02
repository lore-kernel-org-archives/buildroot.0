From: ren_guo <ren_guo@c-sky.com>
Date: Thu, 2 Mar 2017 09:04:41 +0800
Subject: [Buildroot] [PATCH 1/1] csky: Add new architecture
In-Reply-To: <20170301141443.62263c29@free-electrons.com>
References: <1488357224-5141-1-git-send-email-ren_guo@c-sky.com>
 <20170301102208.79668e6f@free-electrons.com>
 <1174d987-9327-9109-8fd5-f369977cb437@c-sky.com>
 <20170301141443.62263c29@free-electrons.com>
Message-ID: <5244ae45-3f9c-e84d-0d12-5354d8d64519@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi, Thomas

> Great. Then please add an entry for yourself in the DEVELOPERS file,
> like:
>
> N:      ren_guo <ren_guo@c-sky.com>
> F:      arch/Config.in.csky
>
> You can also add other F: entries for files that you contributed. But
> the arch/Config.in.csky is particularly important: by assigning this
> file to yourself, you will receive e-mail notifications when there are
> build failures for your architecture.
>
> One package that contains architecture-specific code and that often
> causes problems is libffi. So if you haven't yet looked at implementing
> support for csky in libffi, I would recommend you to have a look.
>
ok, got it.

> However, since initially you will not support the "internal toolchain
> backend" (i.e when Buildroot builds the toolchain from scratch), then
> you should change the definition of BR2_TOOLCHAIN_BUILDROOT with:
>
> 	depends on !BR2_csky
>
> So that on the csky architecture, only the external toolchain option is
> available.

ok, I will be care of it.

Best Regards

guoren
