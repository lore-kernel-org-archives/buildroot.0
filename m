From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jun 2017 16:38:38 +0200
Subject: [Buildroot] [PATCH] util-linux: bump to version 2.30
In-Reply-To: <20170617184306.20584-1-casantos@datacom.ind.br>
References: <20170617184306.20584-1-casantos@datacom.ind.br>
Message-ID: <20170618163838.42484fb0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Jun 2017 15:43:06 -0300, Carlos Santos wrote:
> - Update the "basic set" description to include fincore, which is built
>   by default, and remove tailf, which was removed in this version.
> - Add configuration options for the new utilities "chmem" and "lsmem".
> - Remove patch already applied upstream.
> - Drop autoreconf, since the patch on term-utils/Makemodule.am is gone.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  ...-sys-use-lm-for-scriptreplay-if-necessary.patch | 30 ----------------------
>  package/util-linux/Config.in                       | 24 ++++++++++++-----
>  package/util-linux/util-linux.hash                 |  4 +--
>  package/util-linux/util-linux.mk                   |  9 +++----
>  4 files changed, 24 insertions(+), 43 deletions(-)
>  delete mode 100644 package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
