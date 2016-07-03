From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:26:09 +0200
Subject: [Buildroot] [PATCH 14/69] fwup: add explicit dependencies for
	host variant
In-Reply-To: <20160703070519.GC2750@tarshish>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
 <1467498098-23731-15-git-send-email-julien.floret@6wind.com>
 <20160703085648.01301ba4@free-electrons.com>
 <20160703070519.GC2750@tarshish>
Message-ID: <20160703092609.67947003@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 Jul 2016 10:05:20 +0300, Baruch Siach wrote:

> The simple answer is that since help2man works just fine for the host binary 
> of fwup by definition, there is no build breakage. We may add it to the host 
> variant as well to shorten build time somewhat, though I'm not sure it's worth 
> the trouble.

Ah, ok, I should have looked at the build failure. The build failure
was not about help2man being unavailable on the host system, but about
help2man failing to work building the target variant for some reason.

OK, makes sense then. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
