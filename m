From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:24:49 +0100
Subject: [Buildroot] [PATCH 1/2] kconfig/lxdialog: get ncurses CFLAGS
 with pkg-config
In-Reply-To: <CAEYzJUEV=Z5yb6+DS_vZ9NuOjtsTfX0KGU5jYFa8wjMRt=v8dw@mail.gmail.com>
References: <1414329446-16587-1-git-send-email-bjorn.forsman@gmail.com>
 <1414329446-16587-2-git-send-email-bjorn.forsman@gmail.com>
 <20141026164155.4c1bc8db@free-electrons.com>
 <CAEYzJUGaae4Uqj_v9fWbi4kfygoSLGAku_P8=AedfDV04gCCxA@mail.gmail.com>
 <CAEYzJUEV=Z5yb6+DS_vZ9NuOjtsTfX0KGU5jYFa8wjMRt=v8dw@mail.gmail.com>
Message-ID: <20141026222449.315ce1ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bj?rn Forsman,

On Sun, 26 Oct 2014 22:16:33 +0100, Bj?rn Forsman wrote:

> I've tried to re-sync with linux 3.18-rc1. Without luck. Quite
> frustrating. Something is changed upstream and I don't (yet) manage to
> fill in the missing bits of Make code to have Buildroot's "make
> menuconfig" work with these changes.

Argh :/

At some point, Yann E. Morin was very active on the kbuild/kconfig code
in the upstream Linux kernel. Maybe he can help there?

> Would it be acceptable to add the patch posted in this thread directly
> to support/kconfig/patches/ instead?

Yes, it is acceptable. Especially if the patch description mentions
that it's already upstream, it will help when we'll bump the kconfig
code.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
