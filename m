From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 23:00:33 +0100
Subject: [Buildroot] [PATCH] package/yaffs2utils: fix upstream URL
In-Reply-To: <20191102211409.31980-1-thomas.petazzoni@bootlin.com>
References: <20191102211409.31980-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191104230033.1f1f47eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  2 Nov 2019 22:14:09 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The current URL from which we download the yaffs2utils tarball no
> longer works:
> 
> -2019-11-02 10:17:20--  https://yaffs2utils.googlecode.com/files/0.2.9.tar.gz
> Resolving yaffs2utils.googlecode.com (yaffs2utils.googlecode.com)... 2a00:1450:400c:c02::52, 173.194.76.82
> Connecting to yaffs2utils.googlecode.com (yaffs2utils.googlecode.com)|2a00:1450:400c:c02::52|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2019-11-02 10:17:20 ERROR 404: Not Found.
> 
> So, let's replace it with a working URL.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/yaffs2utils/yaffs2utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
