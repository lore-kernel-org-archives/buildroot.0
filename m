From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:56:27 +0100
Subject: [Buildroot] [PATCH 4/8] package/lockfile-progs: rename variable
In-Reply-To: <8c0d3284088b1915e10387d4808b18b75d2343e5.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <8c0d3284088b1915e10387d4808b18b75d2343e5.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171201225627.045be3a1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:41 +0100, Yann E. MORIN wrote:
> We use package names as poor-man's namespace, so fix that.
> 
> Reported by utils/check-package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/lockfile-progs/lockfile-progs.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
