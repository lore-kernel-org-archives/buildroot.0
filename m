From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 15:42:24 +0200
Subject: [Buildroot] [PATCH] lz4: disable static library on shared only
In-Reply-To: <65ebbceb3ef38f7ce913f048d32921ab438e6ab3.1524568483.git.baruch@tkos.co.il>
References: <65ebbceb3ef38f7ce913f048d32921ab438e6ab3.1524568483.git.baruch@tkos.co.il>
Message-ID: <20180425154224.358ceb04@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 24 Apr 2018 14:14:43 +0300, Baruch Siach wrote:
> Don't build the static library when BR2_SHARED_LIBS=y, to reduce build
> time.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/lz4/lz4.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
