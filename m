From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Dec 2019 15:26:01 +0100
Subject: [Buildroot] [FYI] Bootlin external toolchains
In-Reply-To: <CAMw6YJLJae0GcmrDmSY8FZ-uMj+WBybPkBaLQC1wkhooCjoKyQ@mail.gmail.com>
References: <CAMw6YJLJae0GcmrDmSY8FZ-uMj+WBybPkBaLQC1wkhooCjoKyQ@mail.gmail.com>
Message-ID: <20191202152601.4ab1c8cd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Romain Naour in Cc.

On Mon, 2 Dec 2019 02:47:15 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> Just in case if someone will be interested. I started Buildroot external
> project which provides external toolchains from the Bootlin:
> 
>     https://toolchains.bootlin.com
> 
> The git repo can be found at:
> 
>     https://github.com/vkochan/buildroot-external-toolchain-bootlin

An effort was started to package the Bootlin external toolchains in
Buildroot itself, some time ago by engineers at Smile. We had some
off-list discussion about this, but I don't think it was ever posted to
the list. The idea back then was to have a script that generates all
the packages, but the design was to have one package for each
toolchain, so it really added a lot of packages.

But I think we should really support these toolchains in Buildroot
proper instead of having an external for them.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
