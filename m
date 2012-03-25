From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Mar 2012 00:01:53 +0200
Subject: [Buildroot] [PATCH] package/giblib: fix breakage
In-Reply-To: <1331852049-12761-1-git-send-email-yann.morin.1998@free.fr>
References: <1331852049-12761-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <201203260001.53847.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

On Thursday 15 March 2012 23:54:09 Yann E. MORIN wrote:
> Fix two things in the giblib package:
> 
> 1- fix prefix breakage
>    - s/STAGING/STAGING_DIR/ (Thomas)
>    - prefix is .../usr, not .../usr/lib or .../usr/bin
> 
> 2- fix the configure.ac/Makefile.am breakage
>    - imlib2 sets IMLIB2_(LIBS|CFLAGS), not IMLIB_(LIBS|CFLAGS)
>    - autoreconf the package, install missing files
>      Note that both configure.ac and configure.in are present in the
>      package, so both are fixed, although only configure.ac is used
>      (configure.in is the legacy name).

Ping? Any comment?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
