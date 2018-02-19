From: Nimai Mahajan <nimaim@gmail.com>
Date: Mon, 19 Feb 2018 09:28:28 -0500
Subject: [Buildroot] [PATCH 0/4] llvm for mesa3d
In-Reply-To: <bcb3d4f4-d6c3-c257-81cd-d1b9986f2a0e@smile.fr>
References: <20180216083606.6472-1-valentin.korenblit@smile.fr>
 <0d3785ce-032b-330c-d7ff-fb92bcc07f1d@carallon.com>
 <5fb32f7a-205d-07a9-07bd-f8110259ea2a@smile.fr>
 <1518908435329-0.post@n4.nabble.com>
 <bcb3d4f4-d6c3-c257-81cd-d1b9986f2a0e@smile.fr>
Message-ID: <CALoSW66PR8TmB4vtP8ownFwa0db8yTEm=KftQEPBoBHcvpwtng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 19, 2018 at 7:38 AM, Valentin KORENBLIT <
valentin.korenblit@smile.fr> wrote:

>
>
> On 18/02/2018 00:00, nimaim wrote:
>
>> Hi, thank you for your contribution. I've been manually building and using
>> llvmpipe w/ mesa3d based on Romain's RFC series in patchwork (ignoring the
>> clang, clc stuff), but it would be nice if we can get it officially added.
>>
>> Out of curiosity, have you tested this with mesa3d 17.3.x? Those versions
>> broke llvm for me w/ Romain's older patches ... mesa fails to find and
>> link
>> against the libs. I had to downgrade to the latest 17.2.x (17.2.8 at the
>> time of this posting).
>>
>>
>>
>> --
>> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
> Hi,
>
> I'm using mesa3d 17.3.4 and it works correctly. You should also consider
> that the RFC series uses llvm 4.0.1.


> Regards,
>
> Valent?n
>

Thanks for the confirmation. I actually bumped that series up to 5.0.1
before I tested it but it still broke mesa3d 17.3.x (17.2.x worked fine).
I'm guessing your other fixes to this patch did the trick. Thanks.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180219/55806ac2/attachment.html>
