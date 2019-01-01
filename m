From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:13:30 +0100
Subject: [Buildroot] [PATCH] luarocks: fix generation of license file
 list
In-Reply-To: <20190101072120.28018-1-francois.perrad@gadz.org>
References: <20190101072120.28018-1-francois.perrad@gadz.org>
Message-ID: <20190101111330.73e46657@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Jan 2019 08:21:20 +0100, Francois Perrad wrote:
> check-package requires an hardtab instead of 4 spaces.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/luarocks/0002-Buildroot-addon.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
