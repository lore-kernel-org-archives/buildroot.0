From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Oct 2015 23:24:37 +0200
Subject: [Buildroot] [PATCH v3] package/iqvlinux: new package
In-Reply-To: <20151012231616.3fd41b57@free-electrons.com>
References: <1444397162-5431-1-git-send-email-romain.naour@openwide.fr>
 <20151010150457.GD3640@free.fr>
 <20151012231616.3fd41b57@free-electrons.com>
Message-ID: <20151012212436.GH3735@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain, All,

On 2015-10-12 23:16 +0200, Thomas Petazzoni spake thusly:
> On Sat, 10 Oct 2015 17:04:57 +0200, Yann E. MORIN wrote:
> > > +IQVLINUX_MODULE_MAKE_OPTS = NALDIR=$(@D) KSRC=$(LINUX_DIR) CC=$(TARGET_CC)
> > 
> > Are you sure CC is needed? The kernel buildsystem should already set it, no?
> 
> Yes, it is really needed. The kernel buildsystem indeed defines CC, but
> it gets re-defined by the iqvlinux Makefile, which gets included by the
> kernel buildsystem since we do M=/path/to/iqvlinux to build the
> iqvlinux module.

OK, maybe that could have been explained either as a comment in the .mk
or in the commit log. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
