From: phonic at antisocial.nu <phonic@antisocial.nu>
Date: Thu, 29 Nov 2007 16:41:18 +0100 (CET)
Subject: [Buildroot] X11R7 error
Message-ID: <64956.192.121.234.65.1196350878.squirrel@webmail.portlane.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!
I'm trying to build X11R7 but I get an error in libX11-1.1.1's build process:

../src/util/makekeys <
/root/buildroot/build_i386/staging_dir/usr/include/X11/keysymdef.h >
ks_tables_h
/bin/sh: ../src/util/makekeys: No such file or directory
make[2]: *** [ks_tables.h] Error 127

It seems like src/util/makekeys does not exist, but it does!

Regards
Jonathan
