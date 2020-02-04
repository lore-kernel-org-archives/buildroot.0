From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 11:04:16 +0100
Subject: [Buildroot] [PATCH v2] package/libnspr: remove
 BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
In-Reply-To: <20200204095059.7315-1-giulio.benetti@benettiengineering.com>
References: <20200204095059.7315-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200204110416.074754d8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Feb 2020 10:50:59 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Since all architectures supported by Buildroot are supported by libnspr
> BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT makes no sense anymore, so let's remove
> it all around.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Arnout and I both agreed that we want to keep this blind option, so I'm
not sure I understand why you're sending this patch. Did we miss something?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
