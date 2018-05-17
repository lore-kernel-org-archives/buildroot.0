From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 May 2018 20:53:33 +0200
Subject: [Buildroot] [PATCH 1/2] package/llvm: bump to version 5.0.2
In-Reply-To: <20180517133115.24114-1-valentin.korenblit@smile.fr>
References: <20180517133115.24114-1-valentin.korenblit@smile.fr>
Message-ID: <20180517205333.2cbe35ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 May 2018 15:31:14 +0200, Valentin Korenblit wrote:
> 5.0.2  is API and ABI compatible with 5.0.0 and 5.0.1 and includes
> mitigations for CVE-2017-5715 (Spectre Variant 2) for X86 and MIPS.
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  package/llvm/llvm.hash | 2 +-
>  package/llvm/llvm.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
