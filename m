From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 21:50:22 +0200
Subject: [Buildroot] [PATCH v2 3/3] host-acl: build fix for GCC 4.4.7
In-Reply-To: <20180730220218.26454-3-hollis_blanchard@mentor.com>
References: <20180730220218.26454-1-hollis_blanchard@mentor.com>
 <20180730220218.26454-3-hollis_blanchard@mentor.com>
Message-ID: <20180731215022.33636bf2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Jul 2018 15:02:18 -0700, Hollis Blanchard wrote:
> This didn't introduce any build warnings with host gcc 4.4.7 or gcc 6.3.0.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> ---
>  package/acl/0001-Build-with-old-GCC-versions.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/acl/0001-Build-with-old-GCC-versions.patch

Applied with a tweaked commit log and patch title.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
