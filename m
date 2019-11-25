From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:53:05 +0100
Subject: [Buildroot] [PATCH] package/libftdi: don't override license
 files variable
In-Reply-To: <20191125070319.22261-1-b.bilas@grinn-global.com>
References: <20191125070319.22261-1-b.bilas@grinn-global.com>
Message-ID: <20191125215305.7526493c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 25 Nov 2019 08:03:19 +0100
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Fixes:
>   package/libftdi/libftdi.mk:22: conditional override of variable LIBFTDI_LICENSE_FILES
> 
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/libftdi/libftdi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
