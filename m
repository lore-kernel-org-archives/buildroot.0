From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jan 2017 15:03:09 +0100
Subject: [Buildroot] [PATCH] tslib: needs kernel headers 3.12
In-Reply-To: <4a250493e254e7a958267c5ce153f9ef05e6fc69.1484830247.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 19 Jan 2017 14:50:47 +0200")
References: <4a250493e254e7a958267c5ce153f9ef05e6fc69.1484830247.git.baruch@tkos.co.il>
Message-ID: <87a8antaea.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Kernel headers 3.12+ are required since tslib version 1.3.
 > https://github.com/kergoth/tslib/blob/master/README.markdown

 > Update tslib reverse dependencies.

 > Fixes:
 > http://autobuild.buildroot.net/results/28d/28df38e2a042f1b5940bf35c18334ebf8810a348/
 > http://autobuild.buildroot.net/results/c38/c383cfee3673aa9fba36a86f1e68de63413c2987/
 > http://autobuild.buildroot.net/results/6dd/6ddb2cd9f4f41ee03dc10a73422ad37070811732/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
