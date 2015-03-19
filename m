From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 19 Mar 2015 23:27:22 +0100
Subject: [Buildroot] Worried about patches not being merged?
In-Reply-To: <20150319120923.65bda6ab@free-electrons.com>
References: <20150304232101.437af48f@free-electrons.com>
 <1426708866.1395.8.camel@embedded.rocks>
 <CA+TH9VmRWPdidNHSLArTek4Pxxtw+viOy7_tMbMYturnq0-VaQ@mail.gmail.com>
 <20150319101643.6a4eeed3@free-electrons.com>
 <CA+TH9Vm9myq5YS_3+CsvT5-SZXcGyug3KDUO0Ai8f+daMf6BYg@mail.gmail.com>
 <20150319112638.6e5fc986@free-electrons.com>
 <CA+TH9VnnocY3CWhuiDOL6mZMSCZj+5GXTJpE5yna5pnGqKj8Lg@mail.gmail.com>
 <20150319120923.65bda6ab@free-electrons.com>
Message-ID: <CA+TH9V=wUa6Sh+uszjndiy-FaHsxzbVuvjAFcQWVxTg=qEeJTw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2015-03-19 12:09 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Thu, 19 Mar 2015 11:45:02 +0100, Angelo Compagnucci wrote:
>
>> > It's written in Django, and the code base is small as I said, so should
>> > be easy to get involved. And the maintainer is also very nice, so
>> > contributing shouldn't be a problem. patchwork's maintainer is even
>> > using Buildroot himself, and he has contributed a number of patches, so
>> > the project is definitely not unknown to him.
>>
>> I'm already looking at the code!
>
> Cool!

I have more or less done, I think in the WE I can push a patch to have
tags attached to patches.

>> > This is definitely not the workflow we use today, and probably not the
>> > one we would like to use.
>>
>> Yes, it is out of the box. But changing that workwflow is really easy.
>> From my experiments, you can adapt it to buildroot workflow, in which
>> a patch can be applied only after a severe review.
>
> Ah, really? Could you describe a bit the workflow / how it would work ?

I have to find more time to elaborate if that software could be bended
to buildroot needs. I have only a superficially view right now. I
promise to look better at it.

>> Yes, I know, and that's unfortunate. Btw I think this is a ckicken egg
>> problem, if user patches get reviewed after month, users lose interest
>> and then tend to contribute less.
>
> Yes, I fully agree on this. And that's why I spending *all* my
> Buildroot time on reviewing/merging patches from others.
>
>> Count on me and please delegate to me patches you think I can help
>> review, I'm learning but I want to contribute more!
>
> When, just pick whatever patches in the queue you believe you are
> competent to review / test / ack.
>
>> Yes, can understand and I think the problem is not with this patches,
>> but the pile of new packages / medium level patches / newbie patches.
>
> Well, is there really such a huge pile of new packages / medium level
> patches / newbie patches ? We tend to apply them fairly quickly, in
> general.

Yes, but I have the impression that patches tends to accumulate in a
stack fashion, so the patches served are the last arrived. If a patch
slips out of scope, it takes some time to get reviewed/committed. This
is wouldn't be a critic to your great work nor the work of the other
great reviewer/committers!

> If there are so many "easy" patches, then please review / test / ack
> them. Look at the A/R/T column at
> http://patchwork.ozlabs.org/project/buildroot/list/. It indicates the
> number of Acked-by, Reviewed-by and Tested-by tags. As you can see,
> it's almost 0 0 0 for all patches. Which means nobody reviewed, tested
> or acked the patches.
>
> Also, if you think one patch is ready, has been given some
> Acked/Reviewed/Tested tags and still doesn't get applied, please ping
> me on IRC with a link to this patch.


Thank you all for the great work!

Sincerely, Angelo.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
