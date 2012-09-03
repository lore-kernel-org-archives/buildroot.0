From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Sep 2012 22:03:32 +0200
Subject: [Buildroot] Buildroot 2012.08 released
In-Reply-To: <504224FA.1070908@mind.be>
References: <20120831112123.672bd606@skate>
	<504224FA.1070908@mind.be>
Message-ID: <20120903220332.5b38e9b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 01 Sep 2012 17:08:42 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   It's unfortunate that my patch for detecting legacy XXXTARGETS usage wasn't merged.
> I'm afraid there will be many people hitting that problem...

Yes, this is my fault. I really wanted to merge it, but the 24+h trip
from San Diego back to France erased this from my brain, and when I did
the release of Buildroot on Friday morning, I had completely forgotten
this patch... until lunch but it was too late. My apologies.

I agree with the proposal of doing a 2012.08.1. It could at least
contain this change + the SYSROOT_DIR typo fix.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
