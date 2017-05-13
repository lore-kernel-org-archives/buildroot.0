From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 13 May 2017 19:18:41 +0200
Subject: [Buildroot] [for-next 3/3] package/gcc: remove gcc 4.8
In-Reply-To: <a6njudxk1o.ln2@ID-313208.user.individual.net>
References: <20170513113732.8154-1-romain.naour@gmail.com>
 <20170513113732.8154-3-romain.naour@gmail.com>
 <a6njudxk1o.ln2@ID-313208.user.individual.net>
Message-ID: <cb96a34a-0b54-c1eb-1c6a-14ca2ab909cb@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 13/05/2017 ? 18:00, Bernd Kuhls a ?crit :
> Am Sat, 13 May 2017 13:37:32 +0200 schrieb Romain Naour:
> 
>> -	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> 
> Hi,
> 
> lots of packages contain
> 
> 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> 
> like Kodi:
> https://git.buildroot.net/buildroot/tree/package/kodi/Config.in#n40
> 
> With this patch applied these packages can not be selected anymore 
> because you removed the option BR2_TOOLCHAIN_GCC_AT_LEAST_4_8.

I'm not removing BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 option but BR2_GCC_VERSION_4_8_X
(i.e the option for the internal toolchain).

Thanks for taking a look!

Best regards,
Romain

> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
