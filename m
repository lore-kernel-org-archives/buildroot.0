From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 22:59:11 +0200
Subject: [Buildroot] [PATCH] package/pciutils: bump to version 3.7.0
In-Reply-To: <c067915b3f68fb2632c6b54c3cbcd64e29acf810.1591296216.git.baruch@tkos.co.il>
References: <c067915b3f68fb2632c6b54c3cbcd64e29acf810.1591296216.git.baruch@tkos.co.il>
Message-ID: <20200604225911.1fcbd6a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  4 Jun 2020 21:43:36 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Use CROSS_COMPILE for toolchain prefix. Makefile derives CC, AR, and
> RANLIB from that.
> 
> Remove sed manipulation of the lib/configure script. Host uname is not
> used when the HOST variable is set as we do.
> 
> Remove sed manipulation of Makefile. Set STRIP to an empty string
> instead.
> 
> Format hash file with two space separators.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/pciutils/pciutils.hash |  4 ++--
>  package/pciutils/pciutils.mk   | 13 ++++---------
>  2 files changed, 6 insertions(+), 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
