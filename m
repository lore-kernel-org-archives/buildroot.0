From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 13 Sep 2017 14:26:35 +0200
Subject: [Buildroot] [PATCH] python-six: add host variant
In-Reply-To: <20170912170731.2501c48b@windsurf>
References: <20170908141414.24801-1-julien.floret@6wind.com>
 <20170908232127.475fbb7c@windsurf.lan>
 <CAHfJR7h7oaeStjJrRmxdgL_BHcuKK-uey4vEA=qVJX=PfgiUYw@mail.gmail.com>
 <20170912170731.2501c48b@windsurf>
Message-ID: <CAHfJR7g4Stq7JjrQjCdG5fmwkLUHMcFD5kRrbUQ1xym_0meVbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-09-12 17:07 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Mon, 11 Sep 2017 10:39:04 +0200, Julien Floret wrote:
>
>> > Do you plan to submit a patch adding Open vSwitch ?
>>
>> Unfortunately I don't think so, our integration is too custom and far
>> from upstreamable...
>
> OK.
>
>> Maybe we should introduce a Config.in.host option for explicitly
>> enabling python-six host variant for external packages, like it is
>> done e.g. in python-lxml?
>
> Yes, perhaps we should to that.
>
> Thanks!

OK, I will send a v2 with the Config.in.host option. Thanks.
