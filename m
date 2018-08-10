From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 22:33:34 +0200
Subject: [Buildroot] [PATCH 2/6] package/Makefile.in: Add missing
 options to LDFLAGS for full RELRO build
In-Reply-To: <20180711143113.11927-3-matthew.weber@rockwellcollins.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-3-matthew.weber@rockwellcollins.com>
Message-ID: <20180810223334.31805c7d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Jul 2018 09:31:09 -0500, Matt Weber wrote:
> From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> 
> The options for a full RELRO build should also be added to LDFLAGS.
> 
> Originally submitted as
> http://patchwork.ozlabs.org/patch/904034/
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
