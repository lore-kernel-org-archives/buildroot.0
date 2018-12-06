From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:21:21 +0100
Subject: [Buildroot] [PATCH] package/libiscsi: do not built the manpages
In-Reply-To: <20181204095712.7130-1-yann.morin.1998@free.fr>
References: <20181204093152.10692-1-yann.morin.1998@free.fr>
 <20181204095712.7130-1-yann.morin.1998@free.fr>
Message-ID: <20181206212121.63e2eb5d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Dec 2018 10:57:12 +0100, Yann E. MORIN wrote:
> The pre-rendered, bundled ones are still installed, though, but they
> get removed in target-finalize anyway.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/libiscsi/libiscsi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
