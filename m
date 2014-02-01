From: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
Date: Sat, 1 Feb 2014 17:06:01 +0100
Subject: [Buildroot] [PATCH v2 2/2] gummiboot: new package
In-Reply-To: <20140201154457.GA3574@free.fr>
References: <1391257869-26562-1-git-send-email-cvubrugier@yahoo.fr>
 <1391257869-26562-2-git-send-email-cvubrugier@yahoo.fr>
 <20140201154457.GA3574@free.fr>
Message-ID: <20140201170601.7de38199@trantor>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann Morin,

On Sat, 1 Feb 2014 16:44:58 +0100, Yann E. MORIN wrote :
> > +config BR2_TARGET_GUMMIBOOT
> > +	bool "gummiboot"
> > +	select BR2_PACKAGE_GNU_EFI
> > +	select BR2_PACKAGE_UTIL_LINUX
> > +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> 
> Probably this should also depends on BR2_i386 || BR2_x86_64, I
> guess...

Yes, thanks for noticing this. I assume gnu-efi should depends on
BR2_i386 || BR2_x86_64 as well. Right?

Best regards,

-- 
Christophe Vu-Brugier
