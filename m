From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 18 May 2011 11:20:35 +0200
Subject: [Buildroot] [buildroot] Add libiqrf package.
In-Reply-To: <1305662198-23040-1-git-send-email-marek.belisko@open-nandra.com>
References: <1305662198-23040-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <BANLkTim2bZMkojYixr599H19TJKApA+rRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/5/17 Marek Belisko <marek.belisko@open-nandra.com>:
> +LIBIQRF_INSTALL_TARGET = YES

And if you're going to repost the patch anyway, you can remove this
line since INSTALL_TARGET is YES by default.
