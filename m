From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 22:32:43 +0200
Subject: [Buildroot] [PATCH v2] uclibc: enable debug build option
In-Reply-To: <1463345425-10074-1-git-send-email-ps.report@gmx.net>
References: <1463345425-10074-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160517223243.5368f860@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 May 2016 22:50:25 +0200, Peter Seiderer wrote:
> Set uClibc DODEBUG in case BR2_ENABLE_DEBUG is set.
> 
> Setting DODEBUG was removed with commit 70b7079d3797304fe3c9ba2941d3f446af3cea79
> in Dec. 2013 because of build failures with the old uClibc (now replaced
> with uClibc-ng), no build failure with raspberrypi3_defconfig and
> BR2_ENABLE_DEBUG enabled.
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 --> v2:
>   - fix 'DODEBUG=y' typo (spotted by Thomas Petazzoni)
>   - fix uClibc spelling
>   - add DODEBUG history hint
> ---
>  package/uclibc/uclibc.mk | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
