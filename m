From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Sat, 26 Jun 2010 14:21:29 +0000 (UTC)
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
Message-ID: <i052d8$8up$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-06-26, Peter Korsgaard <jacmet@sunsite.dk> wrote:

> commit: http://git.buildroot.net/buildroot/commit/?id=c2a44f158eedf40be3ab3bc3c76f61fe032d7b34
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

>  comment "initramfs requires a Linux kernel to be built"
>  	depends on !BR2_LINUX_KERNEL

Hey, wait a minute.

I use this option and I don't use Buildroot to build my kernel.

Can somebody explain why this functionality is being removed?

-- 
Grant
