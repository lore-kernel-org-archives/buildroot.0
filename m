From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Mar 2012 16:47:45 +0100
Subject: [Buildroot] [git commit] kmod: add option to install module
 utilities
In-Reply-To: <87fwd03ara.fsf@macbook.be.48ers.dk>
References: <20120322150326.7CEA39693E@busybox.osuosl.org>
 <4F6B426F.1000509@free-electrons.com>
 <87fwd03ara.fsf@macbook.be.48ers.dk>
Message-ID: <20120322164745.4c7d20f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 22 Mar 2012 16:39:53 +0100,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :

> Sooner or later we should, but I'm not sure if kmod is mature enough to
> do it yet. I actually very rarely use kernel modules, perhaps someone
> else knows more about it?

According to the kmod talk at ELC, kmod is now a complete replacement
for module-init-tools, and module-init-tools are deprecated, as Maxime
said. So all distributions are likely to switch to kmod rather soon.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
