From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 Feb 2014 17:33:21 +0100
Subject: [Buildroot] [PATCH v2 2/2] gummiboot: new package
In-Reply-To: <20140201170601.7de38199@trantor>
References: <1391257869-26562-1-git-send-email-cvubrugier@yahoo.fr>
 <1391257869-26562-2-git-send-email-cvubrugier@yahoo.fr>
 <20140201154457.GA3574@free.fr> <20140201170601.7de38199@trantor>
Message-ID: <20140201163321.GA3219@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christophe, All,

On 2014-02-01 17:06 +0100, Christophe Vu-Brugier spake thusly:
> Dear Yann Morin,
> 
> On Sat, 1 Feb 2014 16:44:58 +0100, Yann E. MORIN wrote :
> > > +config BR2_TARGET_GUMMIBOOT
> > > +	bool "gummiboot"
> > > +	select BR2_PACKAGE_GNU_EFI
> > > +	select BR2_PACKAGE_UTIL_LINUX
> > > +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> > 
> > Probably this should also depends on BR2_i386 || BR2_x86_64, I
> > guess...
> 
> Yes, thanks for noticing this. I assume gnu-efi should depends on
> BR2_i386 || BR2_x86_64 as well. Right?

Yes, I guess so. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
