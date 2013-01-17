From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Jan 2013 21:41:14 +0100
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <201301172138.34789.yann.morin.1998@free.fr>
References: <50F6A26D.4030607@petroprogram.com>
 <50F84751.8090102@petroprogram.com>
 <201301172138.34789.yann.morin.1998@free.fr>
Message-ID: <201301172141.15070.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 17 January 2013 Yann E. MORIN wrote:
> On Thursday 17 January 2013 Stefan Fr?berg wrote:
> > As you can see from the top of the line the total sum of uClibc + *all
> > the other stuff (pam etc..)* is just
> > 1.4 MB (the size of libuClibc-0.9.33.2.so itself is just 690 KB)
> 
> uClibc == libuClibc.so + libutil.so + ld-uClibc.so + librt.so + libnsl.so
>           + libm.so + libdl.so + libcrypt.so

Forgot: + libresolv.so + libpthread.so  (still 905KiB already accounted
for those libs)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
