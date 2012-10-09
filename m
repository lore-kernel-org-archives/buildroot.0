From: Valentine Barshak <gvaxon@gmail.com>
Date: Wed, 10 Oct 2012 02:50:53 +0400
Subject: [Buildroot] [PATCH] libglib2: Fix midori save file dialog not
 being rendered
In-Reply-To: <20121005160322.279530c5@skate>
References: <1349386039-817-1-git-send-email-gvaxon@gmail.com>
 <20121005095237.19c642ca@skate> <506EE6B3.1000205@gmail.com>
 <20121005160322.279530c5@skate>
Message-ID: <5074AA4D.5060803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/05/2012 06:03 PM, Thomas Petazzoni wrote:
>
> On Fri, 05 Oct 2012 17:54:59 +0400, Valentine Barshak wrote:
>
>>> Thanks for all your great patches!
>>
>> Thank you! I've been using buildroot for a while and I really like it.
>> Just want to have as little deviations from the mainstream as
>> possible :)
>
> That's certainly a good motivation :)
>
>>> Is there anything that prevents us from bumping libglib2 to this
>>> version instead of backporting patches?
>>
>> I tried to bump to 2.32.2 (and higher), but it didn't work for me.
>> It doesn't build as is. It needs additional hacks to the
>> libglib2-optional-ipv6.patch plus some minor configure script changes
>> (at least).
>>
>> Even when I finally managed to build it, it didn't work.
>> Starting any gtk application would result in no window being
>> displayed. I've tried on a real x86 machine and vmware with no luck.
>> It just hangs without displaying any errors or warnings.
>> It's gonna take some time to debug. Probably some other packages
>> have to be updated as well, I'm not sure.
>>
>> Since cherry-picking this single change worked fine for me, I've
>> decided to stick with it at least for now.
>
> Argh, ok. I hope someone will find the time to fix this. It's not great
> to get stuck with older versions due to regressions.

Yeah, it would be better to move to the newer version, but it might take 
some time, since it doesn't seem to work as is.

Meanwhile, can we have this fix?

Thanks,
Val.

>
> Best regards,
>
> Thomas
>
