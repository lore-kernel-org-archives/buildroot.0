From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 03 Jun 2017 19:09:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/exiv2: fix thread detection
 with xmp support disabled
References: <20170603164322.23694-1-bernd.kuhls@t-online.de>
 <0985fd72-7766-3d82-6029-1a0a7e64db99@gmail.com>
Message-ID: <d37b0exh1d.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 03 Jun 2017 18:48:38 +0200 schrieb Romain Naour:

> Hi Bernd,
> 
> Le 03/06/2017 ? 18:43, Bernd Kuhls a ?crit :
>> ++find_package(Threads REQUIRED)
>> ++
> 
> So it mean that exiv2 depends on BR2_TOOLCHAIN_HAS_THREADS ?

Hi Romain,

oops, yes, v2 sent.

Regards, Bernd
