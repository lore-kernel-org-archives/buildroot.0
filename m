From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 14:30:24 +0200
Subject: [Buildroot] [PATCH] initscripts: Make installation of
 S20urandom optional.
In-Reply-To: <b4563955-d358-cfd3-8ae6-6e358e551595@theobroma-systems.com>
References: <20200718224444.2748609-1-christoph.muellner@theobroma-systems.com>
 <20200719100514.618894ca@windsurf.home>
 <20200719114950.GT18825@scaer> <20200719140921.5bc74639@gmx.net>
 <20200719122457.GV18825@scaer>
 <b4563955-d358-cfd3-8ae6-6e358e551595@theobroma-systems.com>
Message-ID: <20200720143024.10d811d2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Jul 2020 14:26:59 +0200
Christoph M?llner <christoph.muellner@theobroma-systems.com> wrote:

> What about moving S20urandom into a package urandom-scripts
> (similar to ifupdown-scripts)?

This potentially seems like a good idea to me.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
