From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Dec 2017 23:40:15 +0100
Subject: [Buildroot] [PATCH 2/2] dhcp: add upstream security fix
In-Reply-To: <1297d1b88cdabb9705f05b5d05a9615b690ee3de.1513108295.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Dec 2017 21:51:35 +0200")
References: <b408b98eeb4a9479b974d3d98e84b5d1f279c5b2.1513108295.git.baruch@tkos.co.il>
 <1297d1b88cdabb9705f05b5d05a9615b690ee3de.1513108295.git.baruch@tkos.co.il>
Message-ID: <87po6vkfg0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes socket leak that might cause denial of serivce.
 > https://bugzilla.redhat.com/show_bug.cgi?id=1523547

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
