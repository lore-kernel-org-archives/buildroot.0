From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Aug 2009 17:30:15 +0200
Subject: [Buildroot] GCC building error: checking for exception model to
 use... configure: error: unable to detect exception model <|>
 i686-linux-uclibc-gcc: language objective-c not recognized
In-Reply-To: <f3566d60908200724p61f2dfddtec97c8013e20af19@mail.gmail.com>
References: <f3566d60908200724p61f2dfddtec97c8013e20af19@mail.gmail.com>
Message-ID: <20090820173015.071f6319@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 20 Aug 2009 22:24:46 +0800,
Bai Shuwei <baishuwei@gmail.com> a ?crit :

> `/home/baishw/crosscompile/buildroot-2009.05/build_i686/gcc-4.3.3-target/i686-linux-uclibc/libmudflap'
> Checking multilib configuration for libobjc...

I don't think that the Objective-C support in Buildroot is widely used
and tested. Therefore, if you don't need it, I would suggest to disable
it (disable the option named ?Build/install Objective-C compiler and
runtime??. You can also probably do the same with Java and Fortran if
you don't need the support for those languages.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
