From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 Jun 2021 19:51:35 +0200
Subject: [Buildroot] [PATCH v1]
 package/x11r7/xdriver_xf86-video-fbturbo: fix driver loading
In-Reply-To: <87pmwzxm6j.fsf@dell.be.48ers.dk>
References: <20210602201529.6210-1-ps.report@gmx.net>
 <87pmwzxm6j.fsf@dell.be.48ers.dk>
Message-ID: <20210608195135.66664839@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Sun, 06 Jun 2021 13:33:08 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > Port two xf86-video-fbdev upstream patches to xf86-video-fbturbo fixing
>  > incompatibility with latest xorg release and add mandatory module loading
>  > section to installed xorg.conf:
>
> ..
>
>  > +++ b/package/x11r7/xdriver_xf86-video-fbturbo/0004-xorg.conf-add-mandatory-modules-fb-shadow-fbdevhw.patch
>  > ++Section "Module"
>  > ++   Load "fb"
>  > ++   Load "shadow"
>  > ++   Load "fbdevhw"
>
> This has now come up a few times (4a3639bad01a0 and 0054fb6345ae). Do
> you know what caused this change in xorg module loading behaviour and if
> it is intentional or just a bug?
>

Not sure (and I am not a regular X11 user), the following follow-up reference
from the bug report ([1], [2]) is from 2018 (and the attached log from
xorg 1.19.5), seems no lately regression...

Regards,
Peter


[1] https://forums.gentoo.org/viewtopic-p-8245578.html#8245578
[2] https://forums.gentoo.org/viewtopic-t-1081408.html
