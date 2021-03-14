From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 22:53:02 +0100
Subject: [Buildroot] [PATCH v2 1/6] package/libtheora: disable package
 if binutils is affected from bug 21464
In-Reply-To: <20210310091453.23611-2-giulio.benetti@benettiengineering.com>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
 <20210310091453.23611-2-giulio.benetti@benettiengineering.com>
Message-ID: <20210314225302.462b353d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Mar 2021 10:14:48 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This package is affected from binutils bug 21464, since there is no
> workaround, let's disable it.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6c8/6c87be004adf03955c832be72c0c59749f311f71/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libtheora/Config.in | 1 +
>  1 file changed, 1 insertion(+)

This problem still affects binutils 2.33.1 and 2.34. Did you test with
binutils 2.36 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
