From: Nuno da Costa Ferro <nferro@nfive.com>
Date: Fri, 22 Jun 2007 11:45:34 +0100
Subject: [Buildroot] This linker was not configured to use sysroots
Message-ID: <009401c7b4ba$7613bbf0$2311a8c0@OneWorld.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm getting this error while compiling 'fontconfig':
make[4]: Entering directory 
`/build/firmware/buildroot/build_arm/fontconfig-2.4.2/fc-case'
/usr/bin/gcc  -Os -pipe  -I/build/firmware/buildroot/build_arm/staging_dir/usr/include 
 --sysroot=/build/firmware/buildroot/build_arm/staging_dir/ -isysroot 
/build/firmware/buildroot/build_arm/staging_dir   -L/build/firmware/buildroot/build_arm/staging_dir/lib 
 -L/build/firmware/buildroot/build_arm/staging_dir/usr/lib -o fc-case 
fc-case.o

/usr/bin/ld: this linker was not configured to use sysroots


What do I need to do in order to fix this?


Thanks.


Kind regards,

Nuno da Costa Ferro
---------------------------
Number Five Software, S.A.
Development & IT Management
Email: nferro at nfive.com
DDI: +351 261 860 472 
