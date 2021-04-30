From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Apr 2021 10:56:52 +0200
Subject: [Buildroot] [PATCH 1/4] boot/opensbi: add support for version
 configuration
In-Reply-To: <20210430085114.GA183461@x1>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
 <20210429074636.724046-2-thomas.petazzoni@bootlin.com>
 <20210430085114.GA183461@x1>
Message-ID: <20210430105652.24fba877@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Drew,

On Fri, 30 Apr 2021 01:51:14 -0700
Drew Fustini <drew@beagleboard.org> wrote:

> > +config BR2_TARGET_OPENSBI_LATEST_VERSION
> > +	bool "0.8"  
> 
> I believe the latest version of OpenSBI is v0.9 [1].

Absolutely. The opensbi package should be upgraded to the latest
opensbi version if possible, but that's a separate matter from the
BeagleV support.

> Note that we currently have a bit of a confusing situation for the
> BeagleV Starlight board. There are two repositories:
> 
>   * starfive-tech/sft-riscv-opensbi [2]
>   * starfive-tech/beagle_opensbi [3]

Yes, this is (now) clear to me, and I've used the
starfive-tech/beagle_* repos in this defconfig (see PATCH 4/4).

Thanks a lot for your feedback!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
