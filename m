From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 17:25:29 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to
 2.4.106
In-Reply-To: <hd2dnhx29h.ln2@ID-313208.user.individual.net>
References: <20210518044626.17073-1-bernd.kuhls@t-online.de>
 <20210518120105.GB2506__49536.9530793809$1621339293$gmane$org@scaer>
 <hd2dnhx29h.ln2@ID-313208.user.individual.net>
Message-ID: <20210518152529.GS2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-18 17:17 +0200, Bernd Kuhls spake thusly:
> Am Tue, 18 May 2021 14:01:05 +0200 schrieb Yann E. MORIN:
> > You tagged that one for next, but this is actually a minor release that
> > fixes a regression, and adds just a bunch of tests and debug here and
> > there....
> > Is there a reason why that can't be applied to master?
> maybe I am missing some informations but afaics there are no written 
> rules which I can follow when deciding whether a patch is valid for -
> master or -next. When in doubt, especially with a bump like this one 
> which not only fixes bugs but also adds new code, I prefer to send a 
> patch for -next so Thomas, Peter, Arnout or you can decide otherwise.

There are no definite rule, indeed. But when a bump ismostly about
fixes, it should be for master.

In this case, upstream really seems to consider this release as only bug
fixes;
    https://lists.freedesktop.org/archives/dri-devel/2021-May/307025.html

    Some nouveau debug, amdgpu tests, and a regression fix from 105.
    Releasing so 105 doesn't end up being used a lot with a regression.

And if you already have a doubt, state so in a post-commit note, to hint
us so that we don't have to guess...

Applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
