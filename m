From: daggs <daggs@gmx.com>
Date: Mon, 16 May 2016 20:28:59 +0200
Subject: [Buildroot] kodi 16 on aarch64
In-Reply-To: <XnsA60AC45F57D8AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <trinity-8cc2631d-885d-437a-aec1-a88667084c0c-1463257448483@3capp-mailcom-bs05>,
 <XnsA60AC45F57D8AberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <trinity-0209bbe1-f2c4-4b12-8756-00ade5864efc-1463423339523@3capp-mailcom-bs13>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
> Sent: Monday, May 16, 2016 at 8:18 PM
> From: "Bernd Kuhls" <bernd.kuhls@t-online.de>
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] kodi 16 on aarch64
>
> daggs <daggs@gmx.com> wrote in news:trinity-8cc2631d-
> 885d-437a-aec1-a88667084c0c-1463257448483 at 3capp-mailcom-bs05:
> 
> > I'm trying to compile a buildroot aarch64 env with kodi on it.
> 
> Hi,
> 
> Kodi 16.x-Jarvis has no support for aarch64, the next version 17.x-Krypton 
> will have it after my pull request was accepted:
> https://github.com/xbmc/xbmc/commit/62c160c23ed4c074d106f30a43638fac66568ac6
I've tried that patch, it isn't enough, there is a need for more patches as it fails compilation.
> 
> You can also try my buildroot fork with Kodi 17 patches:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/148325
> 
I'm trying to backport the needed patches to kodi 16, in general it compiles (one of the patches is questionable), didn't got to test it yet.
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
