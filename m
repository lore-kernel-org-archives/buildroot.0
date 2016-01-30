From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jan 2016 16:46:20 +0100
Subject: [Buildroot] [PATCH 05/16 v3] core/pkg-generic: reorder
 variables definitions for legal-info
In-Reply-To: <56ACD06A.6000404@lucaceresoli.net>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <db15f4ae0ec3cf941ddbb5f156288ed60f49d60f.1454004518.git.yann.morin.1998@free.fr>
 <56ACD06A.6000404@lucaceresoli.net>
Message-ID: <20160130154619.GF12587@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-01-30 16:02 +0100, Luca Ceresoli spake thusly:
> Yann E. MORIN wrote:
> >Move the declarations of _ACTUAL_SOURCE and _ACTUAL_SITE earlier, so
> >that they are close to where _SOURCE and _SITE are handled.
> >
> >This looks so far like a purely cosmetic change, but makes more sense
> >with the follow-up patch, where we'll need them earlier in the file.
> 
> Not sure in which patch you need this...

In patch 6, since we use _ACTUAL_SOURCE_TARBALL on line 725 (in an
ifeq-block) while it was declared on line 771.

> but it's nice to have
> $(2)_SOURCE and $(2)_ACTUAL_SOURCE_* defined at the same place, thus:
> 
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
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
