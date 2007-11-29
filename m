From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 29 Nov 2007 23:19:18 +0100
Subject: [Buildroot] X11R7 error
In-Reply-To: <64956.192.121.234.65.1196350878.squirrel@webmail.portlane.com>
References: <64956.192.121.234.65.1196350878.squirrel@webmail.portlane.com>
Message-ID: <1196374758.13652.151.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-11-29 klockan 16:41 +0100 skrev phonic at antisocial.nu:
> Hello!
> I'm trying to build X11R7 but I get an error in libX11-1.1.1's build process:
> 
> ../src/util/makekeys <
> /root/buildroot/build_i386/staging_dir/usr/include/X11/keysymdef.h >
> ks_tables_h
> /bin/sh: ../src/util/makekeys: No such file or directory
> make[2]: *** [ks_tables.h] Error 127
> 
> It seems like src/util/makekeys does not exist, but it does!
> 

X11R7 is there to allow people to debug it.
It is not working off the shelf.
Patches are welcome.

> Regards
> Jonathan
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards
Ulf Samuelsson
