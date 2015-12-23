From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 23:01:48 +0100
Subject: [Buildroot] [PATCH v2 1/2] Enabling mesa3d radeon driver for
 all architectures
In-Reply-To: <1450874992-15627-2-git-send-email-ltrimas@synopsys.com>
References: <1450874992-15627-1-git-send-email-ltrimas@synopsys.com>
 <1450874992-15627-2-git-send-email-ltrimas@synopsys.com>
Message-ID: <20151223230148.29f4058b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lada Trimasova,

On Wed, 23 Dec 2015 15:49:51 +0300, Lada Trimasova wrote:
> Mesa32 radeon driver doesn't depend on x86 and can be built for all architectures.
> 
> Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/mesa3d/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
