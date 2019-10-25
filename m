From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 19:33:34 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/gcc: add support for D
 language
In-Reply-To: <20191024181621.29349-3-eric.le.bihan.dev@free.fr>
References: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
 <20191024181621.29349-3-eric.le.bihan.dev@free.fr>
Message-ID: <20191025193334.59d088bc@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Oct 2019 20:16:20 +0200
Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> Since version 9.1, GCC provides support for the D programming language [1].
> 
> So add a Kconfig entry to enable support for it.
> 
> [1] https://dlang.org/
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/gcc/Config.in.host         | 22 ++++++++++++++++++++++
>  package/gcc/gcc-final/gcc-final.mk |  5 +++++
>  2 files changed, 27 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
