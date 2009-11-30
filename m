From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 30 Nov 2009 08:12:01 -0600
Subject: [Buildroot] More build trouble (2009.11-rc1)
In-Reply-To: <op.u37m8yxayqa4qb@jap-lappis>
References: <op.u37m8yxayqa4qb@jap-lappis>
Message-ID: <200911300812.04214.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot maintainers;

Please promote this one on your triage list,
I will be needing gd in my system also (mips, not arm).

Mike
On Mon November 30 2009, Joachim Pihl wrote:
> It didn't do this on 2009.08
> 
> 
> 
> /opt/xscale-toolchain/usr/bin/arm-linux-uclibcgnueabi-gcc -Os -pipe -Os  
> -I/opt/xscale-toolchain/usr/include -I/opt/xscale-toolchain/include  
> --sysroot=/opt/xscale-toolchain/ -isysroot /opt/xscale-toolchain  
> -mtune=xscale -march=armv5te -mabi=aapcs-linux -msoft-float -o  
> .libs/gdparttopng gdparttopng.o  -L/opt/xscale-toolchain/usr/lib  
> -L/usr/lib ./.libs/libgd.so /opt/xscale-toolchain/usr/lib/libpng12.so  
> -L/opt/xscale-toolchain/lib -lz -lm -Wl,--rpath  
> -Wl,/opt/xscale-toolchain/usr/lib
> ./.libs/libgd.so: undefined reference to `__isoc99_sscanf'
> collect2: ld returned 1 exit status
> make[3]: *** [annotate] Error 1
> make[3]: *** Waiting for unfinished jobs....
> ./.libs/libgd.so: undefined reference to `__isoc99_sscanf'
> collect2: ld returned 1 exit status
> make[3]: *** [gdparttopng] Error 1
> make[3]: Leaving directory  
> `/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/gd-2.0.36RC1'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory  
> `/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/gd-2.0.36RC1'
> make[1]: *** [all] Error 2
> make[1]: Leaving directory  
> `/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/gd-2.0.36RC1'
> make: ***  
> [/home/jpihl/system_controller/buildroot-2009.11_rc1/output/build/gd-2.0.36RC1/libgd.so]  
> Error 2
> 
> 
> 
