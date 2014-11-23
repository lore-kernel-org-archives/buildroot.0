From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Nov 2014 09:44:16 +0100
Subject: [Buildroot] [PATCH] heirloom-mailx: disable static build
In-Reply-To: <c2df27588cd0100d90c761439e48bd33c497bae4.1416731660.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 23 Nov 2014 10:34:20 +0200")
References: <c2df27588cd0100d90c761439e48bd33c497bae4.1416731660.git.baruch@tkos.co.il>
Message-ID: <87zjbitifz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > heirloom-mailx implements its own version of getopt() that collides with the C
 > library when linking statically.

 > Fixes:
 > http://autobuild.buildroot.net/results/f67/f67eb63a9a8bb25fb0c071f1aac271e9798d95d1/
 > http://autobuild.buildroot.net/results/722/722f65c4fcc093d6a6a2200c06b2ecb3ee35bc06/
 > http://autobuild.buildroot.net/results/1cc/1cce267cc4b0a7d6bf5ff10f5429ae7dfe96960a/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
