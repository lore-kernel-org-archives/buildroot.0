From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 11:45:56 +0200
Subject: [Buildroot] [PATCH] qt5base: fix misspelling of "directfb"
In-Reply-To: <20161018020957.2662-1-kraai@ftbfs.org>
References: <20161018020957.2662-1-kraai@ftbfs.org>
Message-ID: <20161018114556.238563ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 19:09:56 -0700, Matt Kraai wrote:

> -comment "directfb backend if directb is enabled"
> +comment "directfb backend if directfb is enabled"
>  	depends on !BR2_PACKAGE_DIRECTFB

Thanks, but this sentence in fact doesn't make a lot of sense. It
should be something like:

	directfb backend needs directfb to be enabled

Or perhaps no comment at all because it's completely obvious that to
use DirectFB functionality, you need DirectFB.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
