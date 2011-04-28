From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 28 Apr 2011 14:26:32 +0200
Subject: [Buildroot] [PATCH] libnl: bump to version 2.0
In-Reply-To: <4DB95AE5.7050805@zacarias.com.ar>
References: <4DB7D29E.5000101@visionsystems.de>	<87liywylxb.fsf@macbook.be.48ers.dk>
	<4DB8116B.901@visionsystems.de> <4DB81D23.8050505@zacarias.com.ar>
	<4DB91691.4030308@visionsystems.de>
	<4DB95AE5.7050805@zacarias.com.ar>
Message-ID: <4DB95CF8.8020704@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 28.04.2011 14:17, schrieb Gustavo Zacarias:
> On 04/28/11 04:26, Yegor Yefremov wrote:
>
>>>>> I see there's already a libnl-3.0, is there any reason why you stick
>>>>> with 2.0?
>>>> You're right. I first tried 3.0 and it failed by some package, so I took 2.0 and didn't verify what was wrong. But I just checked the 3.0 version and it works with all 5 packages:
>>>>
>>>> wpa_supplicant
>>>> iw
>>>> hostapd
>>>> kismet
>>>> ti-utils
>>> iw fails to build with 3.0
>>> kismet builds without libnl support with 3.0
>>> hostapd & wpa_supplicant build ok with your patches.
>>> Did you make clean completely before trying? Otherwise you'll get stale
>>> files in staging.
>>> Regards
>> You're right, that were stale files in staging. I made a patch for iw and will send it also upstream.
>>
>> I'll look into kismet issue or has it gone with the latest version?
>>
>> Best regards,
>> Yegor
> Latest kismet doesn't handle libnl-3.0 yet and i've just received your
> patch for it.
> I'll give the whole set a run and Ack once i'm done, we probably want
> libnl-3.0 while we're at it like Peter said. It's supposed to be the
> first API/ABI-stable version.
> Regards.

O.K. Thanks for testing. I'm looking forward to getting the test results.

Yegor
