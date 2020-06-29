From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 29 Jun 2020 22:45:56 +0200
Subject: [Buildroot] [PATCH 1/3] package/binutils: add version 2.34
In-Reply-To: <20200625121302.2286527-1-romain.naour@gmail.com>
References: <20200625121302.2286527-1-romain.naour@gmail.com>
Message-ID: <20200629224556.08df4dc2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Jun 2020 14:13:00 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> From: Romain Naour <romain.naour@smile.fr>
> 
> Rebase existing patches.
> 
> Keep BR2_BINFMT_FLAT disabled for binutils 2.34 since elf2flt issue
> is not fixed [1] [2].
> 
> [1] https://github.com/uclinux-dev/elf2flt/pull/16
> [2] https://github.com/uclinux-dev/elf2flt/issues/12
> 
> See announce:
> https://lists.gnu.org/archive/html/info-gnu/2020-02/msg00000.html
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/binutils/2.34/0001-sh-conf.patch      |  48 +++
>  .../2.34/0002-poison-system-directories.patch | 306 ++++++++++++++++++
>  package/binutils/Config.in.host               |   8 +
>  package/binutils/binutils.hash                |   1 +
>  4 files changed, 363 insertions(+)
>  create mode 100644 package/binutils/2.34/0001-sh-conf.patch
>  create mode 100644 package/binutils/2.34/0002-poison-system-directories.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
