From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Feb 2014 18:55:44 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-07
In-Reply-To: <20140210185116.290b0d86@skate>
References: <20140208073009.5C3E6100CDC@stock.ovh.net>
 <20140208124907.GA3442@free.fr> <20140210093158.1dc26780@skate>
 <20140210173137.GA5239@free.fr>
 <CAAXf6LWUZNKCK8b-K5yGygqv165FaLZdwOVhL4OPDz5jY-YrFQ@mail.gmail.com>
 <20140210185116.290b0d86@skate>
Message-ID: <20140210175544.GC5239@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-02-10 18:51 +0100, Thomas Petazzoni spake thusly:
> On Mon, 10 Feb 2014 18:44:21 +0100, Thomas De Schampheleire wrote:
> 
> > So suppose we need to be able to check on 2_6_3, 3_0 and 3_1, the
> > linaro symbol would become:
> >      config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
> >          select BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6_3
> >          select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
> >          select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
> > 
> > right?
> 
> No. BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1 would already
> select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0, which selects 2.6.39 and so
> on.

Exactly. And we would only have the headers version we're interested in,
not every single one of them (I guess).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
