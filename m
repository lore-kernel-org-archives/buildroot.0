From: yamada.masahiro at socionext.com <yamada.masahiro@socionext.com>
Date: Thu, 1 Nov 2018 03:51:51 +0000
Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot
 config files
In-Reply-To: <20181101010953.20996-1-afshin.nasser@gmail.com>
References: <20181031205608.GA4061@x230>
 <20181101010953.20996-1-afshin.nasser@gmail.com>
Message-ID: <21d8edac1f6c42cba3b40671ef2d5c5a@SOC-EX01V.e01.socionext.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

> -----Original Message-----
> From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of
> Nasser Afshin
> Sent: Thursday, November 01, 2018 10:10 AM
> To: Petr Vorel <petr.vorel@gmail.com>
> Cc: Nasser Afshin <afshin.nasser@gmail.com>; buildroot
> <buildroot@buildroot.org>
> Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot config
> files
> 
> This patch allows us to define config prefix with CONFIG_ environment
> variable. Now we can define BR2_ prefix when we are going to merge
> buildroot fragment configs.
> 
> By setting the proper config prefix, we will have proper 'redundant
> configuration warnings' when we use '-r -m' options.
> 
> This is actually an upstream patch [1] from linux/kbuild project.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
> .git/commit/?h=for-next&id=f6fe19e9d84400e1c9544c1909952c2c7c6a90a2


Please refer to commit ID only after it gets stable in Linus' tree.

I will end up with rebasing
In order to drop some other commits causing a problem.


Thanks.
