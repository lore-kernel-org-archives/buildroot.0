From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 00:05:37 +0100
Subject: [Buildroot] [PATCH] toolchain-external: Update Synopsys
 prebuilt toolchain for ARC cores
In-Reply-To: <1486106801-19293-1-git-send-email-abrodkin@synopsys.com>
References: <1486106801-19293-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20170205000537.35f2b047@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  3 Feb 2017 10:26:41 +0300, Alexey Brodkin wrote:
> Sync external prebuilt toolchain with the one we now build in Buildroot,
> i.e. arc-2016.09. Since that prebuilt toolchain finally has IPv6 enabled
> it works pretty fine for building packages in Buildroot.
> 
> Still note:
>  1) There might be subtle differences between uClibc configuration
>     compared to Buildroot's one.
>  2) A couple of patches we apply on top of Builroot-built toolchain
>     are obviously missing in the prebuilt version - they will be
>     available in the next release.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Vlad Zakharov <vzakhar@synopsys.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../toolchain-external-synopsys-arc/Config.in                | 12 +++++-------
>  .../toolchain-external-synopsys-arc.hash                     |  8 ++++----
>  .../toolchain-external-synopsys-arc.mk                       |  6 +++---
>  3 files changed, 12 insertions(+), 14 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
