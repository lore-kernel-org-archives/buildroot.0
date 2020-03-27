From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 22:50:22 +0100
Subject: [Buildroot] [PATCH] package/monit: Fix URL in comment
In-Reply-To: <20200318091140.2344-1-post@lespocky.de> (Alexander Dahl's
 message of "Wed, 18 Mar 2020 10:11:40 +0100")
References: <20200318091140.2344-1-post@lespocky.de>
Message-ID: <87ftdtfowx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

 > Previous URL gives:
 >     % curl https://mmonit.com/monit/dist/monit-5.25.3.tar.gz.sha256
 >     c10258c8839d20864d30390e7cbf2ff5e0480a67a6fb80c02aa457d6e3390569 monit-5.25.3.tar.gz

 > Current URL is:

 >     % curl https://mmonit.com/monit/dist/monit-5.26.0.tar.gz.sha256
 >     87fc4568a3af9a2be89040efb169e3a2e47b262f99e78d5ddde99dd89f02f3c2 monit-5.26.0.tar.gz

 > This was probably just forgotten on the last version bump.

 > Fixes: ad250c3d1884 ("package/monit: bump to version 5.26.0")
 > Signed-off-by: Alexander Dahl <post@lespocky.de>

Committed to 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
