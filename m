From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Mar 2018 09:08:39 +0100
Subject: [Buildroot] [PATCH RFC next] package/linux: drop useless
 intermediate DTS booleans
In-Reply-To: <82608B5578637D449D4F6ADA43F8E58715CB57@CHN-SV-EXMX01.mchp-main.com>
 (Joshua Henderson's message of "Wed, 7 Mar 2018 22:45:52 +0000")
References: <20180226174721.5785-1-yann.morin.1998@free.fr>
 <82608B5578637D449D4F6ADA43F8E58715CB57@CHN-SV-EXMX01.mchp-main.com>
Message-ID: <87ina7j8fs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <Joshua.Henderson@microchip.com> writes:

Hi,

 > This is a fix for many current broken defconfigs on master resulting in:

 >     linux/linux.mk:490: *** No kernel device tree source specified,
 > check your BR2_LINUX_KERNEL_USE_INTREE_DTS /
 > BR2_LINUX_KERNEL_USE_CUSTOM_DTS settings.  Stop.
 >     Makefile:79: recipe for target '_all' failed
 >     make: *** [_all] Error 2

 > Tested-by: Joshua Henderson <joshua.henderson@microchip.com>

Committed, thanks both.

-- 
Bye, Peter Korsgaard
