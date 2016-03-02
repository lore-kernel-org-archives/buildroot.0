From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 2 Mar 2016 23:16:56 +0100
Subject: [Buildroot] [PATCH] lksctp-tools: new package
In-Reply-To: <56D7618D.7090806@zacarias.com.ar>
References: <1456952871-14155-1-git-send-email-gustavo@zacarias.com.ar>
 <20160302222600.618f2a64@free-electrons.com>
 <56D75D35.5050201@zacarias.com.ar>
 <20160302223946.381d88ce@free-electrons.com>
 <CAGm1_ksdcbvDerS1LUfn1=w_hvmDt8o1mQwMpGGSOzkDQY2UjA@mail.gmail.com>
 <56D7618D.7090806@zacarias.com.ar>
Message-ID: <CAGm1_ktK8bc_OtPnaWbP1tjEGvwAFg9xJoUZ3LEoa-ENOq9h7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 2, 2016 at 10:56 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 02/03/16 18:50, Yegor Yefremov wrote:
>
>> The only differences are placement, i.e. moving lksctp-tools to
>> networking libraries instead of tools and adding another hook. I can
>> respin v3 with these changes.
>>
>> Gustavo, what are you using it for? I was interested in cannelloni
>> package, that depends on it.
>
>
> I'm good with any of both categories since it's a grey area :)
> An old zeromq (external) for sctp support, so the library.
> But it's just a stop-gap until the app is moved to pgm.
> Frankly i only care about the dirt left behind (source files) :P
> Regards.

Frankly speaking your patch is more complete. Thomas, what about
applying Gustavo's one?

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Yegor
