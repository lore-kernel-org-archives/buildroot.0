From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 19:43:19 +0200
Subject: [Buildroot] [PATCH 1/1] python-colorama: new package
In-Reply-To: <55C0CACA.4010105@datacom.ind.br>
References: <1438634219-22000-1-git-send-email-farina@datacom.ind.br>
 <20150804105537.3a5e47f6@free-electrons.com>
 <55C0BEC6.8040207@datacom.ind.br>
 <20150804153825.3a46c00e@free-electrons.com>
 <55C0CACA.4010105@datacom.ind.br>
Message-ID: <20150804194319.52c69bf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 04 Aug 2015 11:23:06 -0300, DATACOM - Farina wrote:

> Our boards has PowerPC/ARM/MIPS running Linux. And also has ARM 
> microcontrollers.
> 
> So, when we build the main firmware (Linux + rootfs) with Buildroot, we 
> also build the microcontroller firmware that goes inside the rootfs 
> (using a secondary toolchain).
> 
> With this way, we have just one build-system (Buildroot), with 
> everything we need integrated on it.
> 
> My apologies if it is not the Buildroot idea, but this kind of 
> integration is facilitating our work.

Interesting use of Buildroot, definitely! I think it makes a lot of
sense to use Buildroot this way, so I understand better what you did.
I'm still a bit reluctant to add host packages in Buildroot without
users, but at least there is a very useful and interesting use case
behind it, so I might be tempted to apply your patch with the host
package included.

I'm obviously interested by the opinion of other Buildroot developers.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
