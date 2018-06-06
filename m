From: Michele Bucca <michele.bucca@gmail.com>
Date: Wed, 6 Jun 2018 23:24:06 +0200
Subject: [Buildroot] Cannot build C++ internal toolchain using uclibc-ng
In-Reply-To: <20180606231532.5982164d@windsurf>
References: <CAPa8UMePbuAEUCFMvYadN+n-zJN2c-N6B9RXL==BffbDLqww9g@mail.gmail.com>
 <20180606204952.58f73809@windsurf>
 <CAPa8UMezPR1Wuh43Pbt_RAVXFmRCCDRu=Yn1V4s-YpdE2fLA-g@mail.gmail.com>
 <20180606231532.5982164d@windsurf>
Message-ID: <CAPa8UMe7aWfRX+gRg=TawdqRaLj3CDee-gJ6Cn0w2aVdE9BkZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-06-06 23:15 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
> Hello,
>
> On Wed, 6 Jun 2018 22:29:33 +0200, Michele Bucca wrote:
>
>> Yes, it shows the same error [1]. By the way here's  the output of a
>> clean build that I've made with the commands :
>>
>> make clean
>> LC_ALL=C make
>>
>> [1] https://pastebin.com/Z6vUVmRE
>>
>
> What Linux distribution and version of this distribution are you using
> as the host system ?

My host system is Debian Jessie 8.10 x86_64 Updated just today with
latest packages from the repos

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
