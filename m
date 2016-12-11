From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:32:03 +0100
Subject: [Buildroot] [PATCH v2 1/3] core: waf-package infra: allow to
 override <pkg>_INSTALL_*_OPTS
In-Reply-To: <1480889938-11075-1-git-send-email-romain.naour@gmail.com>
References: <1480889938-11075-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161211153203.0cbe8092@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Dec 2016 23:18:56 +0100, Romain Naour wrote:
> Some waf packages may want to pass additional variables to waf script
> in install step.
> Allow to override <pkg>_INSTALL_*_OPTS like it's done in other package
> infra.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> v2: override <pkg>_INSTALL_*_OPTS (Yann)
> ---
>  package/pkg-waf.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

I've applied the entire series to master, after doing some minor tweaks
here and there. Please send a follow-up patch that updates the
Buildroot manual section for the waf package infrastructure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
