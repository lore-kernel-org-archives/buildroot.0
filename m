From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:39:25 +0200
Subject: [Buildroot] [PATCH] toolchain-external: Correct hash value
In-Reply-To: <1464098646-124322-1-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1464098646-124322-1-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20160524173925.663bec82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 May 2016 09:04:06 -0500, Clayton Shotwell wrote:
> The aarch64 Linaro toolchain hash is not correct. I downloaded the
> source, validated the signaturei, and locally computed the hash. It
> looks the the current hash was a copy paste error.
> 
> Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> ---
>  toolchain/toolchain-external/toolchain-external.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
