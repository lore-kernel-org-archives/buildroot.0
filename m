From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 14:30:57 +0100
Subject: [Buildroot] rsync fails to build
In-Reply-To: <6699457346BD4E4E8F8D768D2249294C@JohanW7>
References: <6699457346BD4E4E8F8D768D2249294C@JohanW7>
Message-ID: <20140329143057.6e6aa65a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Sat, 29 Mar 2014 14:11:56 +0100, Sagaert Johan wrote:

> With the latest pull :
> 
> Rsync build seems to be broken
> 
> S=64 -c xattrs.c -o xattrs.o
> /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c progress.c -o progress.o
> /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c pipe.c -o pipe.o
> /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c params.c -o params.o
> /home/brcpy/output/host/usr/bin/ccache /home/brcpy/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabi-gcc -std=gnu99 -I. -I.
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -DHAVE_CONFIG_H -Wall -W -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c loadparm.c -o loadparm.o
> In file included from xattrs.c:25:0:
> lib/sysxattrs.h:4:24: fatal error: attr/xattr.h: No such file or directory
> compilation terminated.

It builds fine here.

Can you show the output of the configure step? I believe it might be
detecting something from your host machine.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
