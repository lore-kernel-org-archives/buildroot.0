From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 20 Apr 2017 23:37:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump version to 1.6.29
References: <20170408151713.11047-1-bernd.kuhls@t-online.de>
 <20170409155442.1be46375@free-electrons.com>
Message-ID: <09mnsdx40n.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 09 Apr 2017 15:54:42 +0200 schrieb Thomas Petazzoni:

> So in the context of Buildroot, a value of "yes" would be more logical,
> of course if the PPC processor has VSX instructions. Should we have
> another BR2_<foo> Config.in option for VSX ?

Maybe, but sorry, I do not know enough about the ppc arch to provide 
patches for it so I removed the option in v2:
http://patchwork.ozlabs.org/patch/753019/

While compiling ppc toolchains I got errors like these discussed in 2016:
http://lists.busybox.net/pipermail/buildroot/2016-July/167298.html

> It would be nice to use --enable-<foo> / --disable-<foo> instead of
> --enable-foo=yes / --enable-foo=no. I know there's an existing instance
> of that of libpng.mk, but it would be good to clean it up in a
> preparation patch.

Done: http://patchwork.ozlabs.org/patch/753018/

Regards, Bernd
