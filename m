From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 23:22:59 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: rename patches to follow
 the new name convention
In-Reply-To: <5488661E.10704@imgtec.com>
References: <1418217249-55637-1-git-send-email-kaszak@gmail.com>
 <5488629F.6010401@imgtec.com>
 <CABbD_XAEd=6=15Mm8kQC7keOERhrOZUfL+0fcv3j8uD=+k1oCg@mail.gmail.com>
 <5488661E.10704@imgtec.com>
Message-ID: <20141210222259.GK3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-12-10 15:26 +0000, Vicente Olivert Riera spake thusly:
> On 12/10/2014 03:21 PM, K?roly Kasza wrote:
> > Wouldn't be better to do all packages in one run of "git mv"-s?

Yes, there's a patch from Samuel doing that with a (Python!) script.

> I'm not sure, because there are lots of patches in the patchwork queue
> which may be touch some package-patches, so if you send a patch to
> rename all package-patches for all buildroot packages, there could be
> lots of patches that couldn't be applied as they are. I think it's
> better to fix one package at a time, but that's only my opinion, I could
> be wrong.

Well, except if one really want to bust his number of commits, there is
no reason to do so.

Yesterday during the Patchwork cleanup session, Peter agreed on using
Samuel's script to rename all patches in one go.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
