From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 00:02:37 +0200
Subject: [Buildroot] [PATCH] package/intel-iqvlinux-driver: new package
In-Reply-To: <20151002212402.6e506992@free-electrons.com>
References: <1443789136-31294-1-git-send-email-romain.naour@openwide.fr>
 <20151002212402.6e506992@free-electrons.com>
Message-ID: <560EFEFD.7020202@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 02/10/2015 22:24, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Fri,  2 Oct 2015 14:32:16 +0200, Romain Naour wrote:
> 
>> diff --git a/package/Config.in b/package/Config.in
>> index 79cbbe6..7ae836f 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -130,6 +130,7 @@ endif
>>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>>  	source "package/grep/Config.in"
>>  endif
>> +	source "package/intel-iqvlinux-driver/Config.in"
> 
> I would probably put it in "Hardware handling" instead of "Development
> tools".

Why not, I put it in Development tools since I'm using this driver to flash the
Ethernet controller Intel I210 firmware. I don't think it's intended for a
production system.

Also this driver is not really useful without the Intel SDK which require a NDA
with Intel.
I sent this package just in case...

> 
> Also, shouldn't the name of the package be just iqvlinux instead of
> intel-iqvlinux-driver ?

I found that intel-iqvlinux-driver is more explicit, but ok I'll use iqvlinux if
you prefer.

Best regards,
Romain

> 
> Thanks,
> 
> Thomas
> 
