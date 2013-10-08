From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Oct 2013 00:19:09 +0200
Subject: [Buildroot] [PATCH 02/11] package/weston: fix variable name
In-Reply-To: <9f47cbe09f7914213180912dc88020ca752299f5.1381269937.git.yann.morin.1998@free.fr>
References: <cover.1381269937.git.yann.morin.1998@free.fr>
 <9f47cbe09f7914213180912dc88020ca752299f5.1381269937.git.yann.morin.1998@free.fr>
Message-ID: <20131009001909.75344e51@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  9 Oct 2013 00:09:48 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The weston package uses the $(WAYLAND_VERSION) variable instead of
> $(WESTON_VERSION).
> 
> This went unnoticed for now, as we were using the same version for
> wayland and weston. But that's not always the case, since we have,
> for example: wayland-1.2.1 and weston-1.2.2, and no wayland-1.2.2.
> 
> Fix this by using the correct variable.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Obviously-acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
