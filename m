From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Apr 2018 22:44:12 +0200
Subject: [Buildroot] [PATCH] dnsmasq: add upstream security fix patches
In-Reply-To: <34e581a92b9ce8e77b00a06e06088506bd1e9fab.1518117395.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 8 Feb 2018 21:16:35 +0200")
References: <34e581a92b9ce8e77b00a06e06088506bd1e9fab.1518117395.git.baruch@tkos.co.il>
Message-ID: <877epe7pwj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2017-15107: An attacker can craft an NSEC which wrongly proves
 > non-existence.

 > Cc: Matt Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
