From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:44:41 +0100
Subject: [Buildroot] [PATCH] flashrom: avoid download URL redirect
In-Reply-To: <fce71df77b97c82775049f8e7dd00133e859dcf1.1521663196.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 21 Mar 2018 22:13:16 +0200")
References: <fce71df77b97c82775049f8e7dd00133e859dcf1.1521663196.git.baruch@tkos.co.il>
Message-ID: <87370r6886.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Use the https URL to avoid HTTP 308 redirect. Older wget releases treat
 > it as a hard error.

 > Fixes:
 > http://autobuild.buildroot.net/results/ee6/ee66e5ead70e73f1d2dae1c5ba31ccf054fe15a7/
 > http://autobuild.buildroot.net/results/fb8/fb8509bf9cf03933e45355fd9a6c3fa53d33c44f/
 > http://autobuild.buildroot.net/results/0e1/0e196570207e459c3440d50cecf0032eee6edfc2/

 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
