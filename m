From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 May 2015 22:43:37 +0200
Subject: [Buildroot] [PATCH] google-breakpad: disable on AArch64
In-Reply-To: <554A6F99.2020600@openwide.fr>
References: <1430940523-24342-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <554A6F99.2020600@openwide.fr>
Message-ID: <20150506224337.44d7e77e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 06 May 2015 21:46:33 +0200, Romain Naour wrote:
> Hi Thomas,
> 
> Le 06/05/2015 21:28, Thomas Petazzoni a ?crit :
> > Currently doesn't build, will be fixed upstream in a later version.
> 
> If you try with the aarch64 cs toolchain and the patch [1], google-breakpad
> build fine.
> But I don't have a aarch64 cpu to do a runtime test through.
> 
> [1] http://patchwork.ozlabs.org/patch/467857/

With the Linaro toolchain, it fails with:

  http://autobuild.buildroot.org/results/f45/f45925e63dd6ce09e41e1ce9a449d8fd57575314/build-end.log

But if it builds with the CS AArch64 toolchain, then the issue is
different.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
