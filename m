From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 16:09:41 +0200
Subject: [Buildroot] [[PATCH v2 12/14] package/mender: use MENDER_PKGDIR
 to access local files
In-Reply-To: <20180820130914.22377-13-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-13-mirza.krak@northern.tech>
Message-ID: <20181021160941.11061a69@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 15:09:12 +0200, Mirza Krak wrote:
> Utilize the predefined variable MENDER_PKGDIR which points to the
> directory containing mender.mk and Config.in, along with the local
> files.
> 
> One benefit is also that it works when BR2_EXTERNAL is used, which
> makes it easier to "backport" this to an older external tree.
> 
> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
