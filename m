From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Sep 2015 22:15:42 +0100
Subject: [Buildroot] [PATCHv2] micropython: fix build for MIPS64 n32
In-Reply-To: <20150923231159.16ff509d@free-electrons.com>
References: <1442997860-1402-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150923231159.16ff509d@free-electrons.com>
Message-ID: <5603167E.4050406@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 23/09/15 22:11, Thomas Petazzoni wrote:
> Vicente,
>
> On Wed, 23 Sep 2015 09:44:20 +0100, Vicente Olivert Riera wrote:
>
>> diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
>> index f2ad5bf..7f401bf 100644
>> --- a/package/micropython/micropython.mk
>> +++ b/package/micropython/micropython.mk
>> @@ -10,6 +10,7 @@ MICROPYTHON_LICENSE = MIT
>>   MICROPYTHON_LICENSE_FILES = LICENSE
>>   MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
>>   MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8b4fb4fe140e9cf57fcfa258d0d2d6fe19090fc5.patch
>> +MICROPYTHON_PATCH += https://github.com/micropython/micropython/commit/587914169cc6ff7f0513bd14c42dcbb275bf77bd.patch
>
> There's no need to use a += here, using a single assignment for both is
> nicer. I've changed that and applied, thanks!

Noted. I will do it in that way from now on :-)

Thanks!

Vincent.

> Thomas
>
