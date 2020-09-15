From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 15:33:24 +0200
Subject: [Buildroot] [PATCH] package/glibc: ARC: use upstream 2.32
In-Reply-To: <20200914213748.3953423-1-vgupta@synopsys.com>
References: <20200914213748.3953423-1-vgupta@synopsys.com>
Message-ID: <20200915153324.318c612b@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Sep 2020 14:37:48 -0700
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> ARC glibc port was merged upstream in 2.32
> There's no need to refer to github as it has the exact same version and
> can be retired in future.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  .../glibc.hash                                |  2 ++
>  package/glibc/glibc.mk                        | 20 ++++++++++---------
>  2 files changed, 13 insertions(+), 9 deletions(-)
>  create mode 100644 package/glibc/2.32-2-g386543bc4495f658dcce6cd4d11e4ba6574a46f5/glibc.hash

The hash file for the ARC-specific glibc version used on Github should
be dropped.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
