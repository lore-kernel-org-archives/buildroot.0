From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 21:51:35 +0200
Subject: [Buildroot] [PATCH 18/54] libsysfs: add license information
In-Reply-To: <53AB26EF.7010003@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-18-git-send-email-gustavo@zacarias.com.ar>
 <20140625194159.GD3489@free.fr> <53AB26EF.7010003@zacarias.com.ar>
Message-ID: <20140625195135.GF3489@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-25 16:45 -0300, Gustavo Zacarias spake thusly:
> On 06/25/2014 04:41 PM, Yann E. MORIN wrote:
> 
> >> +LIBSYSFS_LICENSE = GPLv2 (utilities), LGPLv2.1+ (library)
> >> +LIBSYSFS_LICENSE_FILES = cmd/GPL lib/LGPL
> > 
> > I would also add the COPYING file at the root of the package:
> > 
> >     The commands and utilities under the "test" directory are licensed under the
> >     GNU General Public License (GPL) Version 2, June 1991. The full text of the
> >     GPL is located at:
> > 
> >     sysfsutils/cmd/GPL
> > 
> >     The sysfs library is licensed under the GNU Lesser Public License (LGPL)
> >     Version 2.1, February 1999. The full text of the LGPL is located at:
> > 
> >     sysfsutils/lib/LGPL 
> > 
> > Regards,
> > Yann E. MORIN.
> 
> But COPYING is confusing and a half-truth, that's why i avoided it.
> If you look at the source under cmd/ that's also just GPL, and it's not
> under "test", by the COPYING terms one could consider them LGPL.

OK.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
