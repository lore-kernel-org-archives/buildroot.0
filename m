From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 May 2009 12:58:49 -0300
Subject: [Buildroot] unrecognized option `-Qy'
In-Reply-To: <20090522154000.07747478023@ws1-5.us4.outblaze.com>
References: <20090522154000.07747478023@ws1-5.us4.outblaze.com>
Message-ID: <4A16CBB9.2080806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

George Matveev wrote:

> Hi,
> 
> got pretty much same result using buildroot-2009.05-rc2.tar.bz2:
> 
> /home/work/buildrootgeo/build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-as: unrecognized option 
> `-Qy'
> make[2]: *** [build/genmodes.o] Error 1
> make[2]: Leaving directory 
> `/home/work/buildrootgeo/toolchain_build_arm/gcc-4.3.2-initial/gcc'
> make[1]: *** [all-gcc] Error 2
> make[1]: Leaving directory 
> `/home/work/buildrootgeo/toolchain_build_arm/gcc-4.3.2-initial'
> make: *** 
> [/home/work/buildrootgeo/toolchain_build_arm/gcc-4.3.2-initial/.compiled] 
> Error 2
> geomat at fermat:/home/work/buildroot200905rc2$
> 
> Configuration file (also attached) is a bit different this time:
> 
> BR2_GCC_TARGET_ARCH="armv4t"
> 
> was correctly recognized and no manual intervention was needed.
> 
> But still got this "unrecognized option `-Qy'" error.
> This is simple busybox configuration done on Lenny.
> 
> Could someone possibly share .config which resulted in successful build?
> 
> Best regards,
> George

This is my custom config, target is a custom at91rm9200-based board
(arm920t).
I'm using some custom bits like a custom target skeleton/device and
uclibc/busybox config though it shouldn't affect the result.
I can send the extra config bits on a personal mail to you since there's
nothing propietary about them, mostly to avoid cluttering the list.
Regards.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: myconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090522/d342edee/attachment.diff>
