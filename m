From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 22:23:15 +0100
Subject: [Buildroot] [PATCH] librsvg: security bump to version 2.40.20
In-Reply-To: <aaf6ad8dfb35b1dee1bcfaa1f00bb50f19fbcbf9.1518465751.git.baruch@tkos.co.il>
References: <aaf6ad8dfb35b1dee1bcfaa1f00bb50f19fbcbf9.1518465751.git.baruch@tkos.co.il>
Message-ID: <20180213222315.1cfa6d8a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 22:02:31 +0200, Baruch Siach wrote:
> Fixes CVE-2018-1000041: information disclosure via a crafted SVG file.
> 
> Bump to the latest (maybe last) release in the 2.40.x series. Newer
> versions require a Rust compiler.

Dammit, SVG libraries will now require having a Rust compiler around...

> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/librsvg/librsvg.hash | 4 ++--
>  package/librsvg/librsvg.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Anyway, applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
