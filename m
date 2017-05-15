From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:46:08 +0200
Subject: [Buildroot] [PATCH 3/3] package/bluez_utils: fix test build
	issues with musl
In-Reply-To: <20170513171009.5219-3-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 13 May 2017 19:10:09 +0200")
References: <20170513171009.5219-1-romain.naour@gmail.com>
 <20170513171009.5219-3-romain.naour@gmail.com>
Message-ID: <87k25iguen.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Add one missing header and avoid encrypt redefinition.
 > Fixes:
 > http://autobuild.buildroot.net/results/06c/06c930d9c5299b79500d018ac3fb2861ce834c7c/

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Yegor Yefremov <yegorslists@googlemail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
