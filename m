From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Feb 2017 15:18:50 +0100
Subject: [Buildroot] [PATCH] motion: disable autotools host optimization
In-Reply-To: <1486723019-97464-1-git-send-email-ray.kinsella@intel.com>
References: <1486723019-97464-1-git-send-email-ray.kinsella@intel.com>
Message-ID: <20170211151850.11e14f69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Feb 2017 10:36:59 +0000, Ray Kinsella wrote:
> The motion autotools script helpfully detects the host
> Microprocessors intr set and optimizes for it.
> Disabling this feature causes autotools to use the
> target parameters passed by BR instead.
> 
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
>  package/motion/motion.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
