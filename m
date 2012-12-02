From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Dec 2012 19:31:40 +0100
Subject: [Buildroot] [git commit] pkg-infra: introduce errors for legacy
	API
In-Reply-To: <87hao56vee.fsf@dell.be.48ers.dk>
References: <20121130201152.E2AE89940D@busybox.osuosl.org>
 <20121201174909.1d52aad3@skate> <87hao56vee.fsf@dell.be.48ers.dk>
Message-ID: <20121202193140.25122f4e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sat, 01 Dec 2012 18:27:21 -0800, Peter Korsgaard wrote:
> I would call it a bug. I've fixed it like this:
> 
> [PATCH] {rand,allyes}packageconfig: ensure legacy test options don't
>  get enabled
> 
> The legacy BR2_PACKAGE_* options in Config.in.legacy are not supposed to
> be user selectable, so {rand,allyes}packageconfig shouldn't enable them.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Looks good, thanks. At least, the autobuilders are a lot happier now :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
