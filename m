From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:47:54 +0200
Subject: [Buildroot] [PATCH 1/2] openal: Use upstream patch to fix FPU
 related build failures
In-Reply-To: <1473608941-24674-1-git-send-email-nerv@dawncrow.de>
References: <1473608941-24674-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20160911224754.124f0e60@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 17:49:00 +0200, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  .../0002-Build-NEON-code-with-mfpu-neon.patch      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/openal/0002-Build-NEON-code-with-mfpu-neon.patch

I've applied, after:

 * Removing the patch itself, and instead download it from Github
   directly

 * Adding a reference to the autobuilder failure fixed by this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
