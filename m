From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:57:03 +0100
Subject: [Buildroot] [PATCH 6/8] packages: fix trailing spaces and slash
In-Reply-To: <aefa5c8ef3aac130f3a536e692e520affede8e4e.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <aefa5c8ef3aac130f3a536e692e520affede8e4e.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <20171201225703.3fc390c6@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 00:08:43 +0100, Yann E. MORIN wrote:
> ... as reported by utils/check-package.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Adam Duskett <aduskett@gmail.com>
> ---
>  package/busybox/busybox.mk | 2 +-
>  package/ntp/ntp.mk         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
