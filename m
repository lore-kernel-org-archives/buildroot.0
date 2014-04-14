From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 21:03:29 +0200
Subject: [Buildroot] [PATCH 5/6] support/graph-depends: don't show
 toolchain dependency for all packages
In-Reply-To: <20140414210003.2baa485f@skate>
References: <cover.1397421554.git.yann.morin.1998@free.fr>
 <e626cb1d54ac1756750c7ce473dde8d7d5b784b9.1397421554.git.yann.morin.1998@free.fr>
 <20140414210003.2baa485f@skate>
Message-ID: <20140414210329.350d3f0e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 14 Apr 2014 21:00:03 +0200, Thomas Petazzoni wrote:

> Are you sure this works? I applied your patch series, and I still see
> all packages having a dependency on the toolchain. The PDF result is
> http://free-electrons.com/~thomas/pub/bug-toolchain-graph-depends.pdf.

Forget it: I screwed up when applying your patches, and only the first
four patches were applied, while it's the fifth patch that was
implementing this feature.

With all your patches applied, it just works.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
