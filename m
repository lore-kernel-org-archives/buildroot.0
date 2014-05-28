From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 08:43:58 +0200
Subject: [Buildroot] [PATCH 1/1] configs: bump zedboard to 2014.1
In-Reply-To: <CAEBucnAq561jBMHV4ksEr2nT+oZ1ieSJqBuavGNSpxqfgCzZgg@mail.gmail.com>
References: <1401225332-4254-1-git-send-email-spenser@gillilanding.com>
 <20140528081603.0146ff8f@free-electrons.com>
 <CAEBucnAq561jBMHV4ksEr2nT+oZ1ieSJqBuavGNSpxqfgCzZgg@mail.gmail.com>
Message-ID: <20140528084358.53ec9670@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 28 May 2014 01:30:30 -0500, Spenser Gilliland wrote:

> > Does this means that the U-Boot build will fail without those files? If
> > that's the case, then that's not really an acceptable solution, because
> > this defconfig will continuously fail to build in our Jenkins CI.
> 
> No, it will not fail during the build.  However, the boot.bin (uboot spl)
> binary will not work on the target.

Ok, thanks!

(Could you look at replying to my e-mail regarding your remaining
Microblaze related patches in patchwork? Thanks!)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
