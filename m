From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 21:39:18 +0100
Subject: [Buildroot] [PATCH 1/1] azmq: add NPTL dependency
In-Reply-To: <20180223175037.7555-1-fontaine.fabrice@gmail.com>
References: <20180223175037.7555-1-fontaine.fabrice@gmail.com>
Message-ID: <20180225213918.6f815298@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Feb 2018 18:50:37 +0100, Fabrice Fontaine wrote:
> boost-log depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL so add this
> dependency to azmq
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/ffa5f21d7e7c38ea7adebc84f1cc8ee4cff74f1b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix error in subject (NPTL instead of NTPL)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
