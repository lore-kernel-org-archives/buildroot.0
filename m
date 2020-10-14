From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 00:09:25 +0200
Subject: [Buildroot] [PATCH 1/3] support/scripts/gen-bootlin-toolchains:
 add missing glibc toolchain dependencies
In-Reply-To: <20200927143752.1498115-1-romain.naour@gmail.com>
References: <20200927143752.1498115-1-romain.naour@gmail.com>
Message-ID: <20201015000925.39e32d47@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Sep 2020 16:37:50 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> glibc toolchains must be disabled for static only configuration.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/gen-bootlin-toolchains | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
