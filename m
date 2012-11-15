From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 18:23:48 +0100
Subject: [Buildroot] [PATCH] support/gnuconfig: update config.{guess,
 sub} to a newer version
In-Reply-To: <50A51F48.7020803@mind.be>
References: <1352995994-10048-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50A51F48.7020803@mind.be>
Message-ID: <20121115182348.639c11c2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 15 Nov 2012 17:58:48 +0100, Arnout Vandecappelle wrote:

> >   support/gnuconfig/README.buildroot                 |    5 +-
> >   support/gnuconfig/config.guess                     |   74 +++++---
> >   support/gnuconfig/config.sub                       |  138 ++++++++++-----
> >   .../0001-config-add-support-for-uClibc.patch       |  184 ++++++++++++++++++++
> >   .../patches/0002-config-add-support-for-ps2.patch  |   60 +++++++
> >   .../gnuconfig/patches/config.guess.uclibc.patch    |  149 ----------------
> >   support/gnuconfig/patches/config.sub.ps2.patch     |   45 -----
> >   7 files changed, 392 insertions(+), 263 deletions(-)
> >   create mode 100644 support/gnuconfig/patches/0001-config-add-support-for-uClibc.patch
> >   create mode 100644 support/gnuconfig/patches/0002-config-add-support-for-ps2.patch
> >   delete mode 100644 support/gnuconfig/patches/config.guess.uclibc.patch
> >   delete mode 100644 support/gnuconfig/patches/config.sub.ps2.patch
> 
>   Did you forget -M in git send-email?

Does git send-email supports -M ? I know format-patch does, but I used
directly send-email to format+send the patch.

>   Is the ps2 patch still relevant? We certainly don't have mipsEE or ps2 or irx or iop or dvp
> in out target tuple, and I can't imagine that anyone tries to build on a ps2...

I don't think it is necessary, but is was there, so I just updated it.

>   Can the uClibc patch be upstreamed?

It probably could, yes. Do you want to try pushing it? I'm already
working with the libtirpc developers to get our patches merged, and
it's quite a bit of work.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
