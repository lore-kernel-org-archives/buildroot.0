From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:56:15 +0100
Subject: [Buildroot] [PATCH 3/8] package/am335x-pru-package: rename
 variable
In-Reply-To: <4ccdb1415ac3d1eff99f8e4af326b3ca9d807684.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <4ccdb1415ac3d1eff99f8e4af326b3ca9d807684.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171201225615.6268226a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:40 +0100, Yann E. MORIN wrote:
> We use package names as poor-man's namespace, so fix that.
> 
> Reported by utils/check-package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/am335x-pru-package/am335x-pru-package.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
