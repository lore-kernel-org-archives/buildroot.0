From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Dec 2013 11:09:23 +0100
Subject: [Buildroot] [PATCH] toolchain: Allow ld64.so linker
In-Reply-To: <20131202172311.2641462e@kryten>
References: <20131202172311.2641462e@kryten>
Message-ID: <20131202110923.2ac86fb5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Blanchard,

On Mon, 2 Dec 2013 17:23:11 +1100, Anton Blanchard wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
>     
> Expand the glibc dynamic linker check to allow ld64.so.

Can you add to the commit log the specific toolchain/situation for
which this is needed? The external toolchain logic is full of special
cases, and I very often read the commit logs to find out why such or
such special case was added.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
