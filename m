From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jan 2013 22:17:46 +0100
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <50F8645E.2090600@petroprogram.com>
References: <50F6A26D.4030607@petroprogram.com>
 <201301172138.34789.yann.morin.1998@free.fr>
 <50F8645E.2090600@petroprogram.com>
Message-ID: <201301172217.46612.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 17 January 2013 Stefan Fr?berg wrote:
> 17.1.2013 22:38, Yann E. MORIN kirjoitti:
> > What Thomas and I are saying, is that you gained about 1.5MiB on your
> > 520MiB filesystem. That's about a 0.29% gain. Was that worth the hassle?
> > (Beside learning, of course.)
> 
> My gentoo box with similar configuration is 1500 MB. So yeah I think it
> was worth the hassle :-)

No, you're not comparing comparable things.

Of course, I can tell you that my Debian Squeeze is much bigger than my
busybox-based router, but that's not the same thing.

Rebuild your LiveCD with (e)glibc, and compare the sizes. Then you will
notice that the size with eglibc is marginaly bigger than with uClibc.
*That* is what we are saying.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
