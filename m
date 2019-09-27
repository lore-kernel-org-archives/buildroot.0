From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Date: Fri, 27 Sep 2019 16:19:26 +0200
Subject: [Buildroot] SplashScreen on buildroot!
In-Reply-To: <CAHcxfMt3YK2KsoD4+m0RCwo89EaceLNBVd-pGYfC4TG47XfiQQ@mail.gmail.com>
References: <CAHcxfMvg=T52wpnhAx7egT18whj-FMbFBsEi9orj7UgU9vBfuw@mail.gmail.com>
 <3166851.rM8gv8AfGI@zgyarmati-thinkpad-w530>
 <CAHcxfMt3YK2KsoD4+m0RCwo89EaceLNBVd-pGYfC4TG47XfiQQ@mail.gmail.com>
Message-ID: <3286047.kTB3JWgZ3C@zgyarmati-thinkpad-w530>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Freitag, 27. September 2019 15:42:26 CEST Cristian Basile wrote:
> Dear Zoltan,
> Thanks for the answer.
> I'm trying to insert a custom logo during boot up to the buildroot login
> screen.
> I tried to activate the pspsplash package and select
> BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH = "/folder/to/mylogo.png", but doesn't
> compare any logo during startup.
> How can I?
> Regards,
> Cristian.
> 

Dear Cristian,

please keep the mailing list in CC, so others can either benefit from, or 
contribute to the discussion.

Do you also start psplash in one of your init scripts with 
psplash -n&
as the package's help text suggests? What kind of init system do you use, the 
default Busybox init, or you changed it to something else (like systemd)?




> Il giorno ven 27 set 2019 alle ore 12:11 Zoltan Gyarmati <
> 
> zgyarmati at zgyarmati.de> ha scritto:
> > On Donnerstag, 26. September 2019 12:24:33 CEST Cristian Basile wrote:
> > > Dear Buildroot Team,
> > > I can not add a custom splashscreen (or bootup logo) in my buildroot
> > > configuration.
> > > I'd need to know how to insert a custom image as splash screen.
> > > It's possible?
> > > 
> > > Thanks in advance. Regards.
> > > Cristian.
> > 
> > Dear Cristian,
> > 
> > what did you try exactly? You probably need to look into the
> > BR2_LINUX_KERNEL_CUSTOM_LOGO_PATH
> > config option, if you want a custom kernel bootup logo, or
> > enable&configure
> > the psplash package for a standalone bootsplash with more features.
> > 
> > Regards,
> > --
> > Zoltan Gyarmati
> > https://zgyarmati.de


-- 
Zoltan Gyarmati
https://zgyarmati.de
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190927/fec8b9ee/attachment.asc>
