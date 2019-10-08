From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:06:35 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] package/nbd: add host-pkgconf to dependencies
In-Reply-To: <20191006180431.19759-1-fontaine.fabrice@gmail.com>
References: <20191006180431.19759-1-fontaine.fabrice@gmail.com>
Message-ID: <20191008230635.2b481a23@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 20:04:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> pkg-config is used to find libglib2 since version 3.17 and
> https://github.com/NetworkBlockDevice/nbd/commit/ef86bbd9da2e2116ec0da6f9c130fb52e89fc310
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nbd/nbd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
