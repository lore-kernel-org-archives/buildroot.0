From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 15:44:18 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/exim: Add optional OpenSSL
 support
In-Reply-To: <20150412132302.GF4218@free.fr>
References: <1428837942-24631-1-git-send-email-bernd.kuhls@t-online.de>
 <20150412132302.GF4218@free.fr>
Message-ID: <20150412134418.GA21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-12 15:23 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> Note that I was not able to test for static builds, because exim is
> already broken in that case; this defconfig does not build:
[--SNIP--]
> That's because musl does not provide libnsl. But exim does not disable
> libnsl.
> 
> A further fix would be to remove use of libnsl when the C library is not
> glibc.

Woops, wrong, uClibc also has libnsl...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
