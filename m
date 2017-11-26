From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 21:32:32 +0100
Subject: [Buildroot] [PATCH 1/2] jimtcl: explicitly set --host / --build
In-Reply-To: <20171103222838.3974-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 3 Nov 2017 23:28:37 +0100")
References: <20171103222838.3974-1-peter@korsgaard.com>
Message-ID: <87fu90hjbz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/d13/d137680bf1c0ebfacef635cb2f0fc14524759143/

 > Otherwise the (handwritten) configure script uses a config.guess script from
 > 2010 to figure out the build host, breaking builds on ppc64le hosts.

 > The result of --host / --build is only used to detect if we are building for
 > Windows or not, which is why things are working on x86(-64) build hosts
 > without specifying --host even though we are cross compiling - But this may
 > change in the future, so we better pass the correct values.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
