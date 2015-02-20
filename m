From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:06:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix nios2 fenv build
 failure
In-Reply-To: <1424454969-13751-1-git-send-email-bernd.kuhls@t-online.de>
References: <1424454969-13751-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150220190630.690d4612@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 20 Feb 2015 18:56:09 +0100, Bernd Kuhls wrote:

> +	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
> +	depends on !BR2_nios2

Does this problem also occur with the recently merged NIOS II internal
toolchain backend? If not, then we do not want to exclude NIOS II
completely, but only the problematic toolchain(s).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
