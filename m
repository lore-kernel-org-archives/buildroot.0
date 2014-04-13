From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Apr 2014 21:48:19 +0200
Subject: [Buildroot] Patchwork cleanup #8: triaging proposal
In-Reply-To: <CAAXf6LUKOuGpMV0uzR3gDM++pOu9Ldtb=6FfTGHqXjMdpvCfSA@mail.gmail.com>
References: <CAAXf6LUKOuGpMV0uzR3gDM++pOu9Ldtb=6FfTGHqXjMdpvCfSA@mail.gmail.com>
Message-ID: <20140413214819.6c18a47f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 13 Apr 2014 21:43:20 +0200, Thomas De Schampheleire wrote:

> Triage proposal for this session:
> 
> [RFC,5/7] python-linaro-dashboard-bundle: new package
> ludovic.desroches at atmel.com
> http://patchwork.ozlabs.org/patch/282728
> 
> [RFC,6/7] lava-tool: new package
> ludovic.desroches at atmel.com
> http://patchwork.ozlabs.org/patch/282729
> 
> [RFC,7/7] lava-test: new package
> ludovic.desroches at atmel.com
> http://patchwork.ozlabs.org/patch/282730
> 
> Proposal: A, keep (all three patches)

For these ones, I've seen your e-mail sent to Ludovic. I'd prefer these
patches to be removed from patchwork, and the original submitter asked
to rework them using the python-package infrastructure, and also to
submit them in a form that is not RFC.

> package/makedevs: add "l" type for symlinks ownership change
> angelo dureghello <angelo70@gmail.com>
> http://patchwork.ozlabs.org/patch/283015
> 
> Proposal: C unsure: what is the reason for this patch?

I don't remember. To be asked to the submitter?

> [v9] espeak: new package
> Arnaud Aujon <arnaud.aujon@gmail.com>
> http://patchwork.ozlabs.org/patch/284229

Last time I looked, I believe this patch was almost ready. And Arnaud
Aujon is still around.

> python-sip: new package
> Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
> http://patchwork.ozlabs.org/patch/284873
> 
> python-pyqt: new package
> Sergey Kostanbaev <sergey.kostanbaev@gmail.com>
> http://patchwork.ozlabs.org/patch/284874
> 
> Proposal: A keep (above three patches)

Yeah, I believe python-pyqt is quite important, so it would be good to
keep it around. But those patches need some work. Maybe we need someone
interested in adopting those patches?

> [RFC,1/2] host-xxd: new package
> Ryan Barnett <rjbarnet@rockwellcollins.com>
> http://patchwork.ozlabs.org/patch/285936
> 
> [RFC,2/2] uboot: introduce u-boot.pbl format
> Ryan Barnett <rjbarnet@rockwellcollins.com>
> http://patchwork.ozlabs.org/patch/285937
> 
> Although the patch on uboot is quite large, my general feeling is to
> triage this in A: keep.

I know Ryan is still working on these.

> [1/3] ccache: change compilercheck to use compiler and toolchain info
> Danomi Manchego <danomimanchego123@gmail.com>
> http://patchwork.ozlabs.org/patch/287383
> 
> [2/3] ccache: change default cache directory path to match config setting
> Danomi Manchego <danomimanchego123@gmail.com>
> http://patchwork.ozlabs.org/patch/287384
> 
> [3/3] ccache: provide capability to do initial ccache setup
> Danomi Manchego <danomimanchego123@gmail.com>
> http://patchwork.ozlabs.org/patch/287385
> 
> Proposal for the above 3: D more work needed. Looking at Arnout's
> comments on the first patch, this needs to be thought through, and a
> final solution is to be implemented. I really think we should improve
> ccache in buildroot, though, so I hope a proper solution can be found.

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
