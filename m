From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 5 Jun 2017 00:10:15 +0200
Subject: [Buildroot] [PATCH] package/doxygen: bump to 1.8.13
In-Reply-To: <rf8e0ex2v6.ln2@ID-313208.user.individual.net>
References: <20170604201642.28799-1-romain.naour@gmail.com>
 <rf8e0ex2v6.ln2@ID-313208.user.individual.net>
Message-ID: <afea5f6b-df7f-e3e3-f681-8aadb6c90972@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 04/06/2017 ? 22:51, Bernd Kuhls a ?crit :
> Am Sun, 04 Jun 2017 22:16:42 +0200 schrieb Romain Naour:
> 
>> -DOXYGEN_VERSION = 1.8.9.1
>> +DOXYGEN_VERSION = 1.8.13
> 
> Hi,
> 
> for the version bump we already have
> http://patchwork.ozlabs.org/patch/770546/ ;)

Ho! almost the same patch except for the small patch fixing a segfault in xmlgen.

Sorry, I missed your patch but I believe we may need
0001-Bug-776791-1.8.13-Regression-Segfault-building-the-b.patch

What do you think ?

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
