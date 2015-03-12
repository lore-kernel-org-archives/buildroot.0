From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 12 Mar 2015 09:32:52 +0100
Subject: [Buildroot] [PATCH v2 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <20150311085850.GE2177@tarshish>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <1426015688-24902-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <CAMQcK5Kz4_vyCVv3Xq9Sms7UWd2Qjew1c60bXZzkfn6f40QeNg@mail.gmail.com>
 <20150311050652.GB2177@tarshish>
 <CA+TH9V=fN9Zo2+hpRt=M+=N+ZM2WASZo4j5DOzKbDneqhbLWJg@mail.gmail.com>
 <20150311085850.GE2177@tarshish>
Message-ID: <CA+TH9VkgCo3n_SKFiSZt7Q2h5nYhMa-G25bqzto6C0op__TZxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

2015-03-11 9:58 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> Hi Angelo,
>
> On Wed, Mar 11, 2015 at 09:22:49AM +0100, Angelo Compagnucci wrote:
>> I submitted a couple of patches some times ago, but they was rejected
>> because potentially dangerous for users[1][2].
>> So probably you will not have that much luck with this patch.
>>
>> [1] http://lists.busybox.net/pipermail/buildroot/2014-July/101963.html
>> [2] http://lists.busybox.net/pipermail/buildroot/2014-July/103143.html
>
> Well, it is not me suggesting this patch, it is Emeric Vigier. But yes, one of
> our clients asked for this functionality, so I really want this patch applied.
>
> As for previous rejections, the response of ThomasP[1] and Arnout[2] seems to
> indicate that they would be willing to accept this functional addition
> provided that it is (1) properly documented[1], and (2) prints a "big fat
> warning"[2]. Something like Thomas' scenario description[3] should be added to
> the documentation part of this patch.
>
> Thanks for reminding us this previous discussion.
>
> [1] http://lists.busybox.net/pipermail/buildroot/2014-July/101966.html
>
> [2] http://lists.busybox.net/pipermail/buildroot/2014-July/102064.html
>
> [3] http://lists.busybox.net/pipermail/buildroot/2014-July/101941.html

I have my patch on top of my git rebase everytime I pull from master,
so I will be veeeeery glad if you can have it upstreamed!
I love so much the option to clean the target that I use it everyday!

Sincerely, Angelo

>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
