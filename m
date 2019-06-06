From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 08:43:49 +0200
Subject: [Buildroot] [PATCH] package/dhcp: fix upstream URL in Config.in
In-Reply-To: <20190517080243.21719-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 17 May 2019 10:02:43 +0200")
References: <20190517080243.21719-1-thomas.petazzoni@bootlin.com>
Message-ID: <87h893w6vu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The current URL no longer exists, so update it to what looks like the
 > main DHCP upstream site.

 > This issue was noticed by the upstream URL check added by Matt Weber
 > in the pkg-stats script, whose results are visible at
 > http://autobuild.buildroot.net/stats/.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
