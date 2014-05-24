From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 May 2014 18:39:53 +0200
Subject: [Buildroot] [PATCH] attr: add license information
In-Reply-To: <1400937661-10089-1-git-send-email-abrahamh@web.de>
References: <1400937661-10089-1-git-send-email-abrahamh@web.de>
Message-ID: <20140524183953.0f8f9105@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Heiko Abraham,

On Sat, 24 May 2014 15:21:01 +0200, Heiko Abraham wrote:

> +ATTR_LICENSE = GPLv2 LGPGv2.1

Same thing here:

	GPLv2+ (programs), LGPLv2.1+ (libraries)

and there was a typo in your patch: s/LGPG/LGPL, and the comma to
separate the two licenses was missing.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
