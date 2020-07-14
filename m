From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:08:15 +0200
Subject: [Buildroot] [PATCH 1/2] package/exiv2: really disable samples
In-Reply-To: <20200713214023.2094574-1-fontaine.fabrice@gmail.com>
References: <20200713214023.2094574-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714150815.6140419f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 23:40:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> EXIV2_ENABLE_BUILD_SAMPLES has been renamed into EXIV2_BUILD_SAMPLES
> since version 0.27 and
> https://github.com/Exiv2/exiv2/commit/60d436c96960fa314e2d12d017440253ce280d51
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/exiv2/exiv2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
