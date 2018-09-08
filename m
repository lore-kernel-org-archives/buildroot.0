From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 15:30:50 +0200
Subject: [Buildroot] [PATCH 1/1] python-numpy: bump to version 1.15.1
In-Reply-To: <20180906223744.3635-1-joseph.kogut@gmail.com>
References: <20180906223744.3635-1-joseph.kogut@gmail.com>
Message-ID: <20180908153050.26afadba@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Sep 2018 15:37:44 -0700, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
> Patch 0002-Add-support-of-ARC.patch was merged [1] upstream.
>  
> [1] https://github.com/numpy/numpy/commit/8edd610ffa3499eea3580f98f296ec80578fba73

Applied to master, thanks. Since it does fix the build failure with
Python 3.7.0, I amended the commit log with this information, and a
reference to the autobuilder failure.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
