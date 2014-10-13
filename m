From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Oct 2014 08:08:48 +0200
Subject: [Buildroot] [PATCH] hostapd: needs MMU
In-Reply-To: <9e40988de91b109be1cf18bdb8999b15cf10020c.1413178585.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 13 Oct 2014 08:36:25 +0300")
References: <9e40988de91b109be1cf18bdb8999b15cf10020c.1413178585.git.baruch@tkos.co.il>
Message-ID: <87k344sdqn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > hostapd calls fork() since last version bump.
 > Fixes:
 > http://autobuild.buildroot.net/results/945/94543b865db2ff5da34434fdcdf15ea7db73f392/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
