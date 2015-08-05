From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 05 Aug 2015 16:36:34 -0300
Subject: [Buildroot] configs/marvell_ca9_armv7_le_hfp_defconfig
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474AD9109@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474AD9109@svr-wa-exch1.atg.lc>
Message-ID: <55C265C2.6060608@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/08/15 14:04, Lee, Tommy wrote:

> _Question_
>
> The docs/manual/manual.pdf Section 3.1 (Configuration and general usage)
> lists a toolchain sub-folder in the output folder. My output folder does
> not have the such sub-folder. You probably know the reason for this missing.

Hi.
Can you point to the exact location in the manual (say, page in the 
online pdf) where this is so?
Or if it's in the old (Marvell) buildroot then it likely doesn't apply 
to current releases - new features, cleaning up and other factors can 
change that, manuals are normally attached to explicit buildroot releases.

> _Issue_
>
> The Buildroot-2015.05/configs does not have the
> marvell_ca9_armv7_le_uclibc_sfp_reduced_defconfig file in it. I wonder
> if the file needs to be added into the Buildroot-2015.08 release.

That still sounds like a Marvell config from their BR, with the 
difference between both being the floating-point strategy (i assume 
sfp=soft, hfp=hard), which are easy configuration options in mainstream 
buildroot.
Regards.
