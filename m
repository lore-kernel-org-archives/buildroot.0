From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jun 2016 22:22:45 +0200
Subject: [Buildroot] [PATCH 0/8 v3] core: add support for package help
 (branch yem/help)
In-Reply-To: <20160607221844.45eb8b34@free-electrons.com>
References: <cover.1465056706.git.yann.morin.1998@free.fr>
 <20160607221844.45eb8b34@free-electrons.com>
Message-ID: <20160607202245.GD3775@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-07 22:18 +0200, Thomas Petazzoni spake thusly:
> On Sat,  4 Jun 2016 18:30:49 +0200, Yann E. MORIN wrote:
> > Yann E. MORIN (8):
> >       core/pkg-generic: add support for package-defined help
> >       core: name the package before its help text
> >       core/pkg-utils: add a macro to pretty-print a help entry
> >       package/busybox: use the generic help rules
> >       linux: use the generic help rules
> >       package/uclibc: use the generic help rules
> >       boot/barebox: use the generic help rules
> >       core: use the print-help macro to print the main help
> 
> This last commit made me realize that the helper is a bad idea:
> 
>  1/ It makes the code longer in number of lines.
> 
>  2/ It makes it harder to read.
> 
> So, as discussed on IRC, I've reworked your patches to drop the helper
> that pretty-print the help text, and simply used the @echo calls in the
> various packages.
> 
> So essentially, I've dropped patches 3/8 and 8/8, and I've reworked
> patches 4, 5, 6 and 7 to not use the helper.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
