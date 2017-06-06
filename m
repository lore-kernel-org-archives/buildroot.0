From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jun 2017 21:35:00 +0200
Subject: [Buildroot] [PATCH] glibc: remove version choice
In-Reply-To: <20170606175659.GA2566@waldemar-brodkorb.de>
References: <20170606175659.GA2566@waldemar-brodkorb.de>
Message-ID: <20170606213500.0fe44a79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 6 Jun 2017 19:56:59 +0200, Waldemar Brodkorb wrote:
> We do not support uClibc-ng/musl C library version choice support,
> do the same for GNU C Library.
> Add me as Maintainer for the package.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

On this one, I'd like to have the opinion of others. Arnout? Peter?
Yann? What do you think about this?

I don't have a very clear-cut opinion about this one.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index cdd38e6..bfeb824 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1686,6 +1686,7 @@ F:	arch/Config.in.sparc
>  F:	package/uclibc/
>  F:	package/uclibc-ng-test/
>  F:	package/mksh/
> +F:	package/glibc/

Alphabetic ordering not correct here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
