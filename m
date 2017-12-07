From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Dec 2017 22:24:02 +0100
Subject: [Buildroot] [PATCH] rsync: add security fix patches
In-Reply-To: <17fb44f01e897a5d27a57582bd5b21d3cea030a2.1512665543.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 7 Dec 2017 18:52:23 +0200")
References: <17fb44f01e897a5d27a57582bd5b21d3cea030a2.1512665543.git.baruch@tkos.co.il>
Message-ID: <87shcm2pvx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2017-17433 and CVE-2017-17434: remote bypass of security
 > restrictions.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
