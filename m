From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:56:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/imx-mkimage: add dependency to
 host-zlib
In-Reply-To: <1523561529-8217-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1523561529-8217-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <20180412215655.22bdbe65@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 21:32:09 +0200, Erik Larsson wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> ---
>  package/imx-mkimage/imx-mkimage.mk | 1 +
>  1 file changed, 1 insertion(+)

I've added a reference to the autobuilder failure in the commit and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
