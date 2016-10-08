From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 08 Oct 2016 17:45:44 -0300
Subject: [Buildroot] [PATCH 3/4] netatop: enable required kernel feature
References: <20161007232042.0e49c4b2@free-electrons.com>
Message-ID: <57f95af83f96b_78bc3fbbf8005ef8245d1@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Oct 07, 2016 at 06:20 PM, Thomas Petazzoni wrote:

> On Fri,  7 Oct 2016 17:30:30 -0300, Ricardo Martincoski wrote:
>> When netatop is enabled, the required kernel feature is enabled.
>> 
>> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
> 
> Is CONFIG_NETFILTER=y required to *build* the netatop module, or only
> needed at runtime ?

It is required to build the module.

> 
> Two cases:
> 
>  - If it's needed to build the netatop module, then this change should
>    be part of the commit adding the netatop package.

Ok. I will send both in one commit when I respin.

> 
>  - If it's needed only at runtime, we have a more relaxed policy, and we
>    generally don't enforce the kernel options in such a case.
> 

Thank you for your review.

Regards,
Ricardo
