From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 May 2009 16:45:18 -0300
Subject: [Buildroot] unrecognized option `-Qy'
In-Reply-To: <20090521191406.5EA6ABE407E@ws1-9.us4.outblaze.com>
References: <20090521191406.5EA6ABE407E@ws1-9.us4.outblaze.com>
Message-ID: <4A15AF4E.2070202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

George Matveev wrote:

> Hi,
> 
> buildroot-2009.02.tar.bz2 returns this:
> 
> /home/work/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-as: 
> unrecognized option `-Qy'
> make[2]: *** [build/genmodes.o] Error 1
> make[2]: Leaving directory 
> `/home/work/buildroot/toolchain_build_arm/gcc-4.3.2-initial/gcc'
> make[1]: *** [all-gcc] Error 2
> make[1]: Leaving directory 
> `/home/work/buildroot/toolchain_build_arm/gcc-4.3.2-initial'
> make: *** 
> [/home/work/buildroot/toolchain_build_arm/gcc-4.3.2-initial/.compiled] Error 
> 2
> geomat at fermat:/home/work/buildroot$
> 
> when building for arm920t.

Hi.
Why don't you try with buildroot-2009.05-rc2?
This was fixed after 2009.02 was released, i build arm920t images almost
on a daily basis without major issues with gcc-4.3.3 + binutils-2.19.1.
Regards.
