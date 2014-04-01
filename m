From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 01 Apr 2014 19:11:22 +0200
Subject: [Buildroot] [PATCH WIP 15/16] xbmc: Bump version to Gotham_beta3
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
 <1396296389-28821-16-git-send-email-bernd.kuhls@t-online.de>
 <20140331220546.GD5004@free.fr>
Message-ID: <qi8r0bx5mu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20140331220546.GD5004 at free.fr:

>   - a first patch to bump
>   - a second to add uClibc support

both is done by the version bump to Gotham. Frodo does not support uClibc, 
Gotham will do thanks to the two small patches[1] I sent to the xbmc team ;) 
Why I do not like the idea to split the Config.in patch? See next comment...

>   - a third to add mesa3d
>   - a fourth to add vaapi
> 
> This will make it easier to review.

I am not sure if the version bump alone creates a bisectable, that means 
buildable xbmc package. My time is limited, so I prefer not to test four 
different patches for "complex beasts like XBMC" and their ability, that each 
of them still compiles without errors.

> As you said, we should consider this bump as an RFC: better wait for the
> final release rather than bundle a beta release.

Of course ;) But we should start testing, especially on non-intel platforms. 
If something is missing, we still have a chance to get it into Gotham release 
code.

Regards, Bernd

[1] https://github.com/xbmc/xbmc/pull/3920
    https://github.com/xbmc/xbmc/pull/4427
