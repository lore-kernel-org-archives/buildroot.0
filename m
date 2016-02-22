From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@intel.com>
Date: Mon, 22 Feb 2016 23:21:52 +0100
Subject: [Buildroot] [PATCH] msr-tools: new package
In-Reply-To: <CAGm1_kuNhAYrMRf_T3FU5gCoYYT72nEm=MeTRWkdo9FrYjK9-g@mail.gmail.com>
References: <1454087465-23445-1-git-send-email-vincent.stehle@intel.com>
 <CAGm1_kuNhAYrMRf_T3FU5gCoYYT72nEm=MeTRWkdo9FrYjK9-g@mail.gmail.com>
Message-ID: <20160222222152.GA22228@jazz.nc.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

Thank you very much for your review!

On Mon, Feb 22, 2016 at 03:40:59PM +0100, Yegor Yefremov wrote:
> 
> Config.in is missing a depends message like this:
> 
> comment "msr-tools runs only on x86 CPUs"
>         depends on !BR2_i386 && !BR2_x86_64

Good idea; I'll add that.

..
> > +MSR_TOOLS_SOURCE = msr-tools-$(MSR_TOOLS_VERSION).tar.gz
> 
> Do you really need MSR_TOOLS_SOURCE?

And you are right again: this is definitely not necessary to repeat the default
source name :)

Thanks for spotting those; I'll send a v2 right away.

Best regards,

Vincent.
