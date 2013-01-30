From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jan 2013 23:32:22 +0100
Subject: [Buildroot] [PATCH 2/7] package/pmake: add host pmake
In-Reply-To: <5109509F.50404@mind.be>
References: <cover.1359498504.git.yann.morin.1998@free.fr>
 <b0d70289993ab5426e1c411b1fc102c7a8022b5d.1359498504.git.yann.morin.1998@free.fr>
 <5108D155.3060208@mind.be>
 <201301301413.13408.yann.morin.1998@free.fr>
 <5109509F.50404@mind.be>
Message-ID: <20130130233222.54f9173e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 30 Jan 2013 17:55:59 +0100, Arnout Vandecappelle wrote:

>   Doesn't it?  It seems to work for liblockfile...

Does it really work properly?

In the past, a tarball was directly fed into patch, which was finding
some patch contents and that's it. Since then, the apply-patches.sh
script has been reworked to properly apply the patches within a
tarball, but I don't think it applies patches that are contained in
a debian/patches/ directory.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
