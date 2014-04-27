From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Apr 2014 22:31:28 +0200
Subject: [Buildroot] [PATCH] bustle: fix static build
In-Reply-To: <0d6bd6c7f561940efe319ceabaec1968fb546282.1398586240.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 27 Apr 2014 11:10:40 +0300")
References: <0d6bd6c7f561940efe319ceabaec1968fb546282.1398586240.git.baruch@tkos.co.il>
Message-ID: <877g6ay0nz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Use pcap-config to list optional libpcap dependencies needed for static link.
 > Fixes:
 > http://autobuild.buildroot.net/results/569/56987b9c39376d2443b96160485f4fd8eefda9bb/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
