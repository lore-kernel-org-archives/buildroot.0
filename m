From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 26 Jul 2015 21:15:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: fix compilation
 error with musl
In-Reply-To: <20150726200729.GK3770@free.fr>
References: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
 <20150726200729.GK3770@free.fr>
Message-ID: <CA+BsyQ6g=kvdx-GqKN4m0UD0gz-Y5ud1GmpVh82BDcNrnqjcZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Yann, I wasn't sure whether to split it or not and took a wrong
guess :) will submit a split update shortly.

Brendan

On 26 July 2015 at 21:07, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Brendan, All,
>
> On 2015-07-26 18:35 +0100, Brendan Heading spake thusly:
> > exfat-utils build would not build on Linux unless __GLIBC__ was defined.
> > Reworked header file to relax this requirement in favour of other libcs.
> > patch submitted to the exfat-utils mailing list for comment.
> >
> > Also added missing dependency - exfat requires libfuse.
>
> Your patch then does two different things;
>   - add a missing dependency
>   - fix a build failure with musl
>
> It thus should be two different patches, one for each changes.
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
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150726/6fcdfd78/attachment.html>
