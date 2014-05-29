From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 May 2014 23:19:03 +0200
Subject: [Buildroot] [PATCH] thrift: disable for ARC
In-Reply-To: <e63eec000f13ac9865b58ab5efc736db87cb45d3.1401337024.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 29 May 2014 07:17:04 +0300")
References: <e63eec000f13ac9865b58ab5efc736db87cb45d3.1401337024.git.baruch@tkos.co.il>
Message-ID: <87vbso8erc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > thrift uses the __sync_fetch_and_add() atomic primitive that is not available
 > for ARC.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
