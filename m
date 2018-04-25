From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 21:37:00 +0200
Subject: [Buildroot] [PATCH] udftools: add patch to fix build on musl
In-Reply-To: <20180422132600.18820-1-thomas.petazzoni@bootlin.com>
References: <20180422132600.18820-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180425213700.4cef45ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Apr 2018 15:26:00 +0200, Thomas Petazzoni wrote:
> Fixes:
> 
>   http://autobuild.buildroot.net/results/e77a96bd2a73c8255fd078022b11e8c47a4c712e/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...up-pktsetup.c-do-not-include-bits-types.h.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/udftools/0001-pktsetup-pktsetup.c-do-not-include-bits-types.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
