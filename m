From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 20 Apr 2011 10:05:34 +0200
Subject: [Buildroot] [PATCH] package: Adding Next Generation IRC deamon
	ngircd
In-Reply-To: <1303284114-15370-1-git-send-email-fabien.marteau@armadeus.com>
References: <1303284114-15370-1-git-send-email-fabien.marteau@armadeus.com>
Message-ID: <BANLkTimp2XRE3i+8yYp=PMCtdL2h90zihQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabien!

Thanks for contributing. Just a few comments below:

2011/4/20  <fabien.marteau@armadeus.com>:
> From: Fabien Marteau <fabien.marteau@armadeus.com>
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_NGIRCD
> + ? ? ? bool "ngircd"
> + ? ? ? help
> + ? ? ? ? ? ? ? Next Generation IRC server deamon.
> + ? ? ? ? ? ? ? http://ngircd.barton.de
> +

The current format uses 1 tab for identation (as you've done) but 1
tab + 2 spaces for help text. And please put the blank line between
the description and the URL instead. :)
An ideal example: http://git.buildroot.net/buildroot/tree/package/file/Config.in

> +++ b/package/ngircd/ngircd.mk
> @@ -0,0 +1,11 @@
> +NGIRCD_CONF_OPT =

Since you do not specify any CONF_OPT you could just remove the line completely.
