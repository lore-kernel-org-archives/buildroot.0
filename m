From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:37:23 +0200
Subject: [Buildroot] [PATCH] support/config-fragments: add s390x z13 to
 autobuild configs
In-Reply-To: <20200930182641.5588-1-romain.naour@gmail.com>
References: <20200930182641.5588-1-romain.naour@gmail.com>
Message-ID: <20200930213723.05fe0748@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Sep 2020 20:26:41 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Add a minimal s390x s13 autobuild configuration for the
> internal toolchain with glibc.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  .../autobuild/br-s390x-z13-internal-glibc.config              | 4 ++++
>  support/config-fragments/autobuild/toolchain-configs.csv      | 1 +
>  2 files changed, 5 insertions(+)
>  create mode 100644 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
