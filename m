From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 23 Nov 2007 14:30:24 +0200
Subject: [Buildroot] svn commit:
 trunk/buildroot/toolchain:	binutils/2.15 elf2flt gcc gcc/3.4.6
In-Reply-To: <200711231203.17512.atle@nissestad.no>
References: <20071123103255.0E2503004A@busybox.net>
	<200711231203.17512.atle@nissestad.no>
Message-ID: <4746C7E0.9050002@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Atle Nissestad wrote:
>>
> Thanks for merging my changes so quickly!
> There is however a small issue with this commit. The following files should be 
> removed (they are empty):
> 
> trunk/buildroot/toolchain/binutils/2.15/701-nios2-gcc4-buildfix.patch
> trunk/buildroot/toolchain/gcc/3.4.6/901-nios2-ctor_dtor.patch
> trunk/buildroot/toolchain/gcc/3.4.6/nios2-config-fix.patch.conditional
> 
> - Atle
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot


Fixed in rev 20493


Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
