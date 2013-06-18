From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jun 2013 19:00:09 +0200
Subject: [Buildroot] Randomization of kconfig choices?
In-Reply-To: <20130618164904.GB3952@free.fr>
References: <20130618093107.6c08e477@skate>
	<20130618164904.GB3952@free.fr>
Message-ID: <20130618190009.7a08518a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 18 Jun 2013 18:49:04 +0200, Yann E. MORIN wrote:

> No, I could not come up with a satisfiable solution so far. I've put it
> a bit in a limbo, so I can start afresh from a new angle.
> 
> There have been some fixes in this area recently, but alas, none fixes
> the randomisation of choices in presence of KCONFIG_ALLCONFIG.
> 
> But I was planning to work on this this week. Let's see where that will
> get us...

Aren't there some people that know better the history of this kconfig
that would be able to help? It seems like you're now more-or-less the
only one patching this stuff.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
