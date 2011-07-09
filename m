From: Heiko Zuerker <heiko@zuerker.org>
Date: Sat, 9 Jul 2011 08:59:39 -0500
Subject: [Buildroot] [PATCH v2] new package: mysql server and
	client	v5.1 and v5.5
In-Reply-To: <201107090824.49226.minimod@morethan.org>
References: <4df3951e8d62cbcb33b32b7aa071ec270698fa8f.1310217504.git.smiley73@users.sourceforge.net>
 <201107090824.49226.minimod@morethan.org>
Message-ID: <000001cc3e40$71e90f30$55bb2d90$@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> > +config BR2_PACKAGE_MYSQL_51
> > +	bool "5.1.x"
> > +	select BR2_TARGET_SYSLINUX
> >
> 
> That looks strange to my eyes.
> How is MySQL and SysLinux related so that you __must__ have SysLinux?
> 
> Wouldn't it be better to put a "with syslinux" choice in the options
listing that
> follows below?

Good catch.
New patch has been sent in.

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org
