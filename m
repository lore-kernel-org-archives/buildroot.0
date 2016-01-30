From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jan 2016 12:55:46 +0100
Subject: [Buildroot] [PATCH 03/16 v3] core/pkg-utils: add macro to
 hardlink-or-copy
In-Reply-To: <56AC9EB6.2000907@lucaceresoli.net>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <496a4dbb0c7e2bfd0be8726e3d8a2aab4f1d830d.1454004518.git.yann.morin.1998@free.fr>
 <56AC9EB6.2000907@lucaceresoli.net>
Message-ID: <20160130115545.GB12587@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-01-30 12:29 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >This macro will try to copy a source file into a destination fdirectory,
> 
> fdirectory -> directory
> 
> >by first atempting a hard-link, and falling back to a plain copy.
> 
> atempting a -> attempting to

No matter how many times I'll try to proof-read my prose, I'll always
leave typoes lying here and there... Seems like it is easier to
proff-read others'...

[--SNIP--]
> With typos fixed:

Done.

> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> [Ran 'make legal-info' with output dir on {the same,another} fs]
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

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
