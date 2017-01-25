From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 22:24:13 +0100
Subject: [Buildroot] [PATCH] Revert "tslib: disable raw input plugin
	under kernel < v3.12"
In-Reply-To: <94c51efa07549195cb340849a8657fe552c05387.1485369174.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 25 Jan 2017 20:32:54 +0200")
References: <94c51efa07549195cb340849a8657fe552c05387.1485369174.git.baruch@tkos.co.il>
Message-ID: <87vat2g7eq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > This reverts commit 46d6aa520f2490928f27da716356b00da357cc99.
 > Since commit 7c60211ce382 (tslib: needs kernel headers 3.12)
 > BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 is always enabled when building tslib. No
 > need to check for that.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.


-- 
Bye, Peter Korsgaard
