From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Apr 2019 22:01:08 +0200
Subject: [Buildroot] [PATCH] package/biosdevname: fix configure failure
In-Reply-To: <20190403134553.126164-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Wed, 3 Apr 2019 15:45:53 +0200")
References: <20190403134553.126164-1-giulio.benetti@micronovasrl.com>
Message-ID: <878swqg8or.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > On version bump to 0.7.3 SITE has been modified to use github
 > instead of http tarball. Github tarball doesn't contain ./configure file
 > differently from 0.7.2 http tarball, so need to autoreconf and generate
 > it.

 > Add BIOSDEVNAME_AUTORECONF = YES to package recipe.

 > Fixes:
 > http://autobuild.buildroot.net/results/3fc/3fc31982af87210b66cbe412410d11c85c9cebd6/

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Fabrice, what went wrong here?

Committed, thanks.

-- 
Bye, Peter Korsgaard
