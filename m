From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 15:19:22 +0100
Subject: [Buildroot] [PATCH] WPE WebKit
In-Reply-To: <20181231133932.29718-1-francois.perrad@gadz.org>
References: <20181231133932.29718-1-francois.perrad@gadz.org>
Message-ID: <20181231151922.59b5c9db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Mon, 31 Dec 2018 14:39:27 +0100, Francois Perrad wrote:

> Francois Perrad (5):
>   libwpe: new package
>   wpebackend-fdo: new package
>   webkitgtk: remove GTK in WEBKITGTK_ARCH_SUPPORTS* variable names
>   wpewebkit: new package
>   cog: new package

Also, the patches in your series are not numbered. Could you use "git
format-patch -n" instead of "git format-patch -N", add a version prefix
(with git format-patch -v2) and resend with a changelog ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
