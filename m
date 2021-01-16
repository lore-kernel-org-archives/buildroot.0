From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 22:01:35 +0100
Subject: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-bootlin: update PowerPC 440
 FP toolchain
In-Reply-To: <20210114224000.456977-1-thomas.petazzoni@bootlin.com>
References: <20210114224000.456977-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210116220135.034aeb68@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Jan 2021 23:39:59 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The Bootlin PowerPC 440 FP toolchain was rebuilt in version 2020.08-2,
> which is rebased on Buildroot 2020.08.3 as that includes a fix for
> SecurePLT support.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../Config.in.options                         | 16 ++++++-------
>  .../toolchain-external-bootlin.hash           | 24 +++++++++----------
>  .../toolchain-external-bootlin.mk             | 12 +++++-----
>  3 files changed, 26 insertions(+), 26 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
