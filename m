From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 10 Nov 2013 17:18:55 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #2 (deadline
	November 17)
In-Reply-To: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
References: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
Message-ID: <CAAXf6LXNrRKU5dvc8DqXdrgS-L1nZQ7GC4YNceFSpbkbz+2XeA@mail.gmail.com>
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

Time for an intermediate reminder. Following patches are still unanswered:

>
> Add support for the HABA-KNX-LITE
> Gregory Hermant <gregory.hermant@calao-systems.com>
> http://patchwork.ozlabs.org/patch/180241
>
> Add custom boards support for Atmel SAM-BA software
> Gregory Hermant <gregory.hermant@calao-systems.com>
> http://patchwork.ozlabs.org/patch/180668
>

Gregory: are these common boards used by other people than yourself?
If so, are you still interested in getting this support in buildroot?

> upx: high-performance executable packer with in-place decompression support
> Stefan Fr?berg <stefan.froberg@petroprogram.com>
> http://patchwork.ozlabs.org/patch/180285

Stefan: are you still interested in getting this package in mainline buildroot?

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

All the above patches are related to PAM. If anyone is interested in
better linux-pam support in buildroot, I'd suggest to have a look at
the above patches. I don't personally need it, and I also don't know
how common PAM usage is in embedded systems.

Any input is appreciated...

Thanks,
Thomas
