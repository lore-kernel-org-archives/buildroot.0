From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:35:13 +0100
Subject: [Buildroot] [NEXT 1/1] sngrep: bump to 1.4.5
In-Reply-To: <20180206180346.12338-1-aduskett@gmail.com>
References: <20180206180346.12338-1-aduskett@gmail.com>
Message-ID: <20180208223513.250deea9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 13:03:46 -0500, Adam Duskett wrote:
> Also add 0001-Fix-building-against-LibreSSL.patch to fix compiling against
> LibreSSL.
> 
> This patch has been submitted and accepted upstream.
> https://github.com/irontec/sngrep/commit/0ee014d497986c40de264f6392b01fdf4e337fd5
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  .../0001-Fix-building-against-LibreSSL.patch       | 78 ++++++++++++++++++++++
>  package/sngrep/sngrep.hash                         |  6 +-
>  package/sngrep/sngrep.mk                           |  2 +-
>  3 files changed, 82 insertions(+), 4 deletions(-)
>  create mode 100644 package/sngrep/0001-Fix-building-against-LibreSSL.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
