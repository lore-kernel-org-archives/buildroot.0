From: Julien Floret <julien.floret@6wind.com>
Date: Mon, 11 Sep 2017 10:39:04 +0200
Subject: [Buildroot] [PATCH] python-six: add host variant
In-Reply-To: <20170908232127.475fbb7c@windsurf.lan>
References: <20170908141414.24801-1-julien.floret@6wind.com>
 <20170908232127.475fbb7c@windsurf.lan>
Message-ID: <CAHfJR7h7oaeStjJrRmxdgL_BHcuKK-uey4vEA=qVJX=PfgiUYw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

2017-09-08 23:21 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Fri,  8 Sep 2017 16:14:14 +0200, Julien Floret wrote:
>> From: Samuel Gauthier <samuel.gauthier@6wind.com>
>>
>> Needed to build Open vSwitch >= 2.6.
>>
>> Signed-off-by: Samuel Gauthier <samuel.gauthier@6wind.com>
>> Signed-off-by: Julien Floret <julien.floret@6wind.com>
>
> Do you plan to submit a patch adding Open vSwitch ?

Unfortunately I don't think so, our integration is too custom and far
from upstreamable...
Maybe we should introduce a Config.in.host option for explicitly
enabling python-six host variant for external packages, like it is
done e.g. in python-lxml?
