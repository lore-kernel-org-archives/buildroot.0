From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Dec 2017 10:17:59 +0100
Subject: [Buildroot] [PATCH] package/libcue: is not parallel-safe
In-Reply-To: <20171221164817.32302-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 21 Dec 2017 17:48:17 +0100")
References: <20171221164817.32302-1-romain.naour@gmail.com>
Message-ID: <874lojyvco.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The last commit before the 1.4.0 release was to disable parallel build [1]
 > [1] https://github.com/lipnitsk/libcue/commit/bebbc18a8c00a0b8c26bc6191af68c6a83629b40

 > Fixes:
 > http://autobuild.buildroot.net/results/f25/f256037ca3d49f96add8ca2e2f9c980f5f9d764e
 > http://autobuild.buildroot.net/results/d84/d84c7d0cb9cf5fa9996c42149eda5295700516f5

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
