From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 12:39:27 +0100
Subject: [Buildroot] [PATCH] package/pcre: install headers in legacy
 location
In-Reply-To: <20141223112136.GA4152@free.fr>
References: <1418490513-10957-1-git-send-email-yann.morin.1998@free.fr>
 <20141221231948.77de4e62@free-electrons.com>
 <20141223112136.GA4152@free.fr>
Message-ID: <20141223123927.4378caf5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 23 Dec 2014 12:21:36 +0100, Yann E. MORIN wrote:

> One the one hand, we woudl certainly prefer to fix packages to use the
> new location, so we can eventually get rid of our hacks to make them
> build when we eventually update them.
> 
> On the other hand, I'm afraid this could be an endless hide-and-seek
> game, which would take us quite some efforts to upstream our patches,
> especially for packages that may still want to build on older systems
> with the old layout...
> 
> However, for now, the only offender in this respect is nmap, so I can
> try to fix it and upstream the fix.

Hard to take a decision without having an idea on the number of
affected packages. So far, if only nmap has been detected by the
autobuilders, it seems like not that many packages are broken by this
issue, and therefore fixing nmap seems to be the right solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
