From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 08:41:07 +0100
Subject: [Buildroot] [PATCH] git: fix static link with openssl
In-Reply-To: <ed0c71f0657461f6b03b20ab4afbc4567d87d4fa.1423557599.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 10 Feb 2015 10:39:59 +0200")
References: <ed0c71f0657461f6b03b20ab4afbc4567d87d4fa.1423557599.git.baruch@tkos.co.il>
Message-ID: <87wq3nziek.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > openssl needs -lz when building statically.
 > Fixes:
 > http://autobuild.buildroot.net/results/4b3/4b33f3f415776cf43be0910b583d222711a03cad/

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
