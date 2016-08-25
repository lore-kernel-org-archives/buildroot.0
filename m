From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 25 Aug 2016 09:29:50 +0200
Subject: [Buildroot] Analysis of build results for 2016-08-08
In-Reply-To: <34622bb9-7ff7-2d15-fa97-e5ed6570034b@gmail.com>
References: <20160809063032.89898101A55@stock.ovh.net>
 <20160809141535.4c9b8169@free-electrons.com>
 <17850212-c769-63c4-f05b-79adc47f470c@gmail.com>
 <34622bb9-7ff7-2d15-fa97-e5ed6570034b@gmail.com>
Message-ID: <2e0ca47d-83cf-4c2d-844b-9560b98733c3@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On 22/08/2016 21:49, Romain Naour wrote:
> Hi Julien, Thomas,
>
> Le 09/08/2016 ? 16:07, Romain Naour a ?crit :
>> Hi Thomas, All,
>>
>> [snip]
>>
>>>>          arm |                host-efl-1.17.2 | NOK | http://autobuild.buildroot.net/results/89bf12f8333d47af0cb5775c859e26f300af56cc/
>>> edje_cc: Critical. Unable to open temp file "(null)" for pre-processor.
>>>
>>> Romain? This looks like a transient error, but I'm not sure.
>> I already seen this issue on autobuilders but I'm not able to reproduce it
>> locally...
> Julien, this issue occurs only on your autobuilder, can you verify if it
> reproducible. If yes, can you send me the usual files log (config.log, build log
> etc)

yes, it's 100% reproducible.

Best regards,
Julien
