From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 16:41:41 +0200
Subject: [Buildroot] [PATCH] package/llvm: add dependency on shared
 libraries
In-Reply-To: <20180406093958.9392-1-valentin.korenblit@smile.fr>
References: <20180406093958.9392-1-valentin.korenblit@smile.fr>
Message-ID: <20180406164141.53fbe576@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Apr 2018 11:39:58 +0200, Valentin Korenblit wrote:
> llvm generates libLLVM.so, so it won't work if BR2_STATIC_LIBS is set
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>

Interestingly, I haven't seen any failure of LLVM related to static
libraries reported by the autobuilders.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
