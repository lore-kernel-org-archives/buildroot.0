From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Fri, 27 Sep 2019 12:11:16 +0200
Subject: [Buildroot] SplashScreen on buildroot!
In-Reply-To: <CAHcxfMvg=T52wpnhAx7egT18whj-FMbFBsEi9orj7UgU9vBfuw@mail.gmail.com>
References: <CAHcxfMvg=T52wpnhAx7egT18whj-FMbFBsEi9orj7UgU9vBfuw@mail.gmail.com>
Message-ID: <3166851.rM8gv8AfGI@zgyarmati-thinkpad-w530>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Donnerstag, 26. September 2019 12:24:33 CEST Cristian Basile wrote:
> Dear Buildroot Team,
> I can not add a custom splashscreen (or bootup logo) in my buildroot
> configuration.
> I'd need to know how to insert a custom image as splash screen.
> It's possible?
> 
> Thanks in advance. Regards.
> Cristian.
Dear Cristian,

what did you try exactly? You probably need to look into the
BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH
config option, if you want a custom kernel bootup logo, or enable&configure 
the psplash package for a standalone bootsplash with more features.

Regards,
-- 
Zoltan Gyarmati
https://zgyarmati.de
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190927/a80710c9/attachment.asc>
