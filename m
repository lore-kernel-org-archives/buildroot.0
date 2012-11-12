From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Nov 2012 22:05:39 +0100
Subject: [Buildroot] [PATCH for-2012.11 1/5] pkg-infra: introduce errors
 for legacy API
In-Reply-To: <1352750912-16012-2-git-send-email-arnout@mind.be>
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
 <1352750912-16012-2-git-send-email-arnout@mind.be>
Message-ID: <20121112220539.7e41409b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 12 Nov 2012 21:08:28 +0100, Arnout Vandecappelle

> +# Include legacy before the other things, because package .mk files
> +# may rely on it.
> +ifneq ($(BR2_DEPRECATED),y)
> +include Makefile.legacy
> +endif

BR2_LEGACY here maybe?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
