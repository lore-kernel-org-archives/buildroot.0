From: Stanislav Vlasic <svlasic@gmail.com>
Date: Thu, 20 Mar 2014 17:07:04 +0100
Subject: [Buildroot] autoreconf: Command not found
In-Reply-To: <20140319184238.GB3328@free.fr>
References: <CADYw_JJ+tid_YUNwBquEjnBiin+4uNN6bMSd9AEV++zf-5Xwdw@mail.gmail.com>
 <20140319184238.GB3328@free.fr>
Message-ID: <CADYw_JJYQFccmGm0OE65u_LROK3eHRmHc6VOQtq8V9aQks=H9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanx everybody for answering,

based on suggestions and patches, I managed to build xbmc and everything
else needed for buildroot.

Related to buildroot, all patches/packages are originally from official
2014.02 buildroot, except amlogic changes (additional packages), packages
in thirdparty folder and
patches to alsa-lib, sdl and sdl_image (to be also available as host
packages).

Commits:
https://github.com/Stane1983/buildroot-M3-MX/commits/2014.02-Amlogic


On Wed, Mar 19, 2014 at 7:42 PM, Yann E. MORIN <yann.morin.1998@free.fr>wrote:

> Stanislav, All,
>
> On 2014-03-19 08:06 +0100, Stanislav Vlasic spake thusly:
> > sorry if I'm duplicating question but I'm facing problem building 3rd
> party
> > package on 2014.02 buildroot (package: xbmc, but doesn't really matter).
>
> Please note that we have a pending patch to add XBMC:
>     http://patchwork.ozlabs.org/patch/323307/
>
> It's v8, and there are still a few rough edges, but some people have
> reported success using that patch.
>
> (Cc-ing Maxime, since he's the original author.)
>
> If at all, it would be nice to help finalise this patch so it can be
> applied upstream Buildroot, rather than trying to work on your own fork
> of Buildroot (which may or may not have changes not in the Official
> Buidlroot, and that prevents us from really helping you).
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>       |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140320/d728cb88/attachment.html>
