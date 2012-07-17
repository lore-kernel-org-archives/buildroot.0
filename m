From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 00:15:58 +0200
Subject: [Buildroot] [PATCH] libnspr: fix 64-bit build
In-Reply-To: <1341959145-20368-1-git-send-email-arnout@mind.be>
References: <1341959145-20368-1-git-send-email-arnout@mind.be>
Message-ID: <20120718001558.066dfd4b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 11 Jul 2012 00:25:45 +0200,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> On some architectures (found on x86_64, but probably others too),
> libnspr builds with -m32 unless it is configured for 64-bit build.  So
> force 64-bit build on 64-bit architectures.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
