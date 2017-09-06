From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 11:04:29 +0200
Subject: [Buildroot] [PATCH] gpsd: fix compile for microblaze arch
In-Reply-To: <20170813085926.GA13312@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sun, 13 Aug 2017 10:59:26 +0200")
References: <20170813085926.GA13312@waldemar-brodkorb.de>
Message-ID: <87fuc0i4f6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Disable O2 and add O0. The suggested flags in the gcc report
 > are not enough for gcc >= 6.

 > Fixes:
 >   http://autobuild.buildroot.net/results/368/3686cd3f3e7b6aee84f4377bd2dded1115321fb3/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
