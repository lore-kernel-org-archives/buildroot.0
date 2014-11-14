From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 14:57:05 +0100
Subject: [Buildroot] [PATCH] dovecot: fix static build
In-Reply-To: <3b0aedc38538637a502da2d96c7a5455972ef134.1415902091.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 13 Nov 2014 20:08:11 +0200")
References: <3b0aedc38538637a502da2d96c7a5455972ef134.1415902091.git.baruch@tkos.co.il>
Message-ID: <87ppcpga1a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch removing reference to MODULE_SUFFIX when it is undefined.
 > Fixes:
 > http://autobuild.buildroot.net/results/c68/c6844bbffff1cd4f738a5fced011d28f73c90b16/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
