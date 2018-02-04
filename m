From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Feb 2018 23:48:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/libcodec2: fix upstream source
 URL
In-Reply-To: <20180203224127.10311-1-bernd.kuhls@t-online.de>
References: <20180203224127.10311-1-bernd.kuhls@t-online.de>
Message-ID: <20180204234812.45f26a6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Feb 2018 23:41:27 +0100, Bernd Kuhls wrote:
> Upstream changed to URL of the source tarball and removed SHA1SUMS.
> Added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libcodec2/libcodec2.hash | 3 +--
>  package/libcodec2/libcodec2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
