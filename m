From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Oct 2016 11:23:59 +0200
Subject: [Buildroot] [PATCH] bind: don't lookup zlib.h in host headers
In-Reply-To: <e3ea410def37657791e392d7b96910ed79041b8e.1476865452.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 19 Oct 2016 11:24:12 +0300")
References: <e3ea410def37657791e392d7b96910ed79041b8e.1476865452.git.baruch@tkos.co.il>
Message-ID: <87insoelow.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > configure.in looks in host headers for zlib.h, unless given a headers
 > directory as --with-zlib parameter.

 > Note: a bug in the zlib.h header lookup logic causes configure.in to add
 > -l$(STAGING_DIR)/usr/include/include, and -L$(STAGING_DIR)/usr/include/lib.
 > But this does not affect us.

 > Fixes:
 > http://autobuild.buildroot.net/results/e96/e96a36c4da3c3be4b79a27af75a70bb8955c31a9/
 > http://autobuild.buildroot.net/results/e0b/e0bd7df5c19c7c65ce0009b7c2b4d4104a5c3109/
 > http://autobuild.buildroot.net/results/e99/e993940067f7ae841132765f91bfee7248ab125f/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
