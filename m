From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jan 2016 16:43:58 +0100
Subject: [Buildroot] [PATCH 06/16 v3] core/legal-info: ensure legal-info
 works in off-line mode
In-Reply-To: <56ACD739.8050205@lucaceresoli.net>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <bd9e70a4286f01ccd6612f19ee541aad9350ac79.1454004518.git.yann.morin.1998@free.fr>
 <56ACCF1D.5090103@lucaceresoli.net>
 <20160130152414.GC12587@free.fr>
 <56ACD739.8050205@lucaceresoli.net>
Message-ID: <20160130154358.GE12587@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-01-30 16:31 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
[--SNIP--]
> >Side note in this respect: is _ACTUAL_SOURCE supposed to support
> >multiple archives in there? If yes, then the current code (before that
> >patch) is not correct, as it does not treat _ACTUAL_SOURCE as a list and
> >does not iterate over it when calling the DOWNLOAD macro.
> >
> >I think it would make sense to support to support a list in there, but
> >that is work for a separate patch.
> 
> It would be nice, but I don't think there is any actual use case in the
> foreseeable future.

Except I can very easily see separate archvies for pre-built toolchains'
actual sources, one for each of gcc, binutils, glibc and so on...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
