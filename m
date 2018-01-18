From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jan 2018 17:53:19 +0100
Subject: [Buildroot] [PATCH] util-linux: add ISC licence, used by rfkill
In-Reply-To: <20180118002103.7783-1-casantos@datacom.ind.br>
References: <20180115204216.GD11122@scaer>
 <20180118002103.7783-1-casantos@datacom.ind.br>
Message-ID: <20180118175319.05c33622@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 Jan 2018 22:21:03 -0200, Carlos Santos wrote:
> Pull a patch from upstream that adds Documentation/licenses/COPYING.ISC
> instead of distributing the whole rfkill.c file.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/util-linux/0001-docs-add-ISC-licence.patch | 38 ++++++++++++++++++++++
>  package/util-linux/util-linux.hash                 |  2 +-
>  package/util-linux/util-linux.mk                   |  2 +-
>  3 files changed, 40 insertions(+), 2 deletions(-)
>  create mode 100644 package/util-linux/0001-docs-add-ISC-licence.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
