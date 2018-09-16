From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 21:47:31 +0200
Subject: [Buildroot] [PATCH v5 1/3] runc: bump to 69663f0b
In-Reply-To: <20180913052225.26676-1-christian@paral.in>
References: <20180913052225.26676-1-christian@paral.in>
Message-ID: <20180916214731.59eb4c94@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Sep 2018 22:22:23 -0700, Christian Stewart wrote:
> This commit bumps runc to the requisite version for Docker 2018.06.
> 
> Added note about where runc version dependency is declared:
> 
> RUNC_VERSION = 69663f0bd4b60df09991c08812a60108003fa340
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/runc/runc.hash | 2 +-
>  package/runc/runc.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

I have the hash of the license file and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
