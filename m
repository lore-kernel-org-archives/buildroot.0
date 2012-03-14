From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 23:25:13 +0100
Subject: [Buildroot] [PATCHv2] ext-toolchain: Automatically set -m64 if
 the architecture is x86_64
In-Reply-To: <1331677800-3777-1-git-send-email-arnout@mind.be>
References: <20120305111246.68ec6324@skate>
 <1331677800-3777-1-git-send-email-arnout@mind.be>
Message-ID: <20120314232513.4a82afba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 13 Mar 2012 23:30:00 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> Without the -m64, choosing the x86_64 architecture with a Sourcery external
> toolchain will result in a 32-bit rootfs.
> 
> Also simplified the help text to reflect this change.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
