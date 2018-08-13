From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:18:26 +0200
Subject: [Buildroot] autobuilder flock hangs
In-Reply-To: <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
Message-ID: <20180813231826.31d1d041@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Yann in Cc.

On Mon, 13 Aug 2018 11:18:10 -0700, Hollis Blanchard wrote:

> >>        x86_64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/43b9bccacd88397d732fda16d998fa7dc001f900 |  
> > Hollis: your autobuilder times out when downloading this package, could
> > you have a look ? See
> > http://autobuild.buildroot.net/?reason=azure-iot-sdk-c%.  
> 
> 
> >>        xtensa |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/34b8bb8824d369e5b53e2a4effd1a8d18df07aee |  
> > Hollis, once again your autobuilder timing out when downloading stuff:
> > http://autobuild.buildroot.net/?reason=linux-firmware%.  
> flock was hanging. I don't know why; have you experienced anything like 
> that?

Not that I remember. Yann ?

> I deleted the directories and subsequent manual dl-wrapper invocations 
> succeeded, so I restarted the builder.

Hm, OK. Let's see what happens in the next days, but this feels a bit
scary. Could you keep monitoring
http://autobuild.buildroot.net/?status=TIMEOUT and see if other
timeouts pop up on your autobuilder ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
