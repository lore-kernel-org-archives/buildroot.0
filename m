From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 17 Nov 2013 10:12:16 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #2 (deadline
	November 17)
In-Reply-To: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
References: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
Message-ID: <CAAXf6LVpEs7QJmfa6o1cXq73mQkw15PnMHSU6_WuVVvzQ33CYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Fri, Nov 1, 2013 at 4:09 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> All,
>
> For those who haven't seen the first patchwork cleanup session, here is
> a quick recap: every session we'll be posting the list of the 10 oldest
> patches, with the original patch contributors in copy. During two weeks,
> we have the opportunity to discuss the patch, whether it is still
> necessary or not, how it should be changed to be merged.
>
> In particular, I'm interested in knowing if the original contributor is
> still interested by the patch, or if someone else is interested in
> adopting the patch and sending an updated version, or if the patch no
> longer makes sense due to other changes made in Buildroot.
>
> All patches that have not received any comment or attention before the
> deadline will be removed from patchwork. This is aggressive, but we have
> many 'dead' patches sitting in patchwork, and this cannot work.
>
> For this second session, I set the deadline to November 17. Below are the
> 10 oldest patches (obtained with a slightly modified version of pwclient):
> [ pwclient list -s New -n 10 ]
>
>
> Add support for the HABA-KNX-LITE
> Gregory Hermant <gregory.hermant@calao-systems.com>
> http://patchwork.ozlabs.org/patch/180241
>
> upx: high-performance executable packer with in-place decompression support
> Stefan Fr?berg <stefan.froberg@petroprogram.com>
> http://patchwork.ozlabs.org/patch/180285
>
> Add custom boards support for Atmel SAM-BA software
> Gregory Hermant <gregory.hermant@calao-systems.com>
> http://patchwork.ozlabs.org/patch/180668
>
> linux: add default defconfig
> Arnout Vandecappelle <arnout@mind.be>
> http://patchwork.ozlabs.org/patch/181185
>
> [1/4] If linux-pam is built, enable dbm functionality in Berkeley DB
> Dimitry Golubovsky <golubovsky@gmail.com>
> http://patchwork.ozlabs.org/patch/182497
>
> [2/4] Make Berkeley DB a dependency of linux-pam and make sure it is selected
> Dimitry Golubovsky <golubovsky@gmail.com>
> http://patchwork.ozlabs.org/patch/182498
>
> [3/4] Provide PAM default configuration files when building linux-pam package
> Dimitry Golubovsky <golubovsky@gmail.com>
> http://patchwork.ozlabs.org/patch/182499
>
> [4/4] PAM support in Busybox if linux-pam is built
> Dimitry Golubovsky <golubovsky@gmail.com>
> http://patchwork.ozlabs.org/patch/182500
>
> Fixing linux-pam build failures
> Stefan Fr?berg <stefan.froberg@petroprogram.com>
> http://patchwork.ozlabs.org/patch/182537
>
> [RFC] patches-from-git.sh: new support script
> Arnout Vandecappelle <arnout@mind.be>
> http://patchwork.ozlabs.org/patch/182856
>

At the end of this session, all patches have been rejected. Feel free
to revive any of the patches later when you have time.

I will postpone the next patchwork cleanup session until after
buildroot-2013.11 is released, to make sure everyone is focused on
stabilization now. Please have a look at autobuild failures in the
mean time!

Thanks,
Thomas
