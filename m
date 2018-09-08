From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:06:34 +0200
Subject: [Buildroot] [PATCH 1/1] duktape: fix hash for license
In-Reply-To: <20180907061119.21642-1-asafka7@gmail.com>
References: <20180907061119.21642-1-asafka7@gmail.com>
Message-ID: <20180908150634.03d413cf@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Sep 2018 09:11:19 +0300, Asaf Kahlon wrote:
> Fixes:
> http://autobuild.buildroot.net/results/4645456f715eccfce940a54e41a34a299adc152f
> http://autobuild.buildroot.net/results/4ee6de3351c140bde4588252cebbf7cf9237e710
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/duktape/duktape.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
