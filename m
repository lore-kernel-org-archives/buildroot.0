From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 May 2021 09:48:09 +0200
Subject: [Buildroot] [PATCH] package/rt-tests: add patch to fix
 compatibility with make 3.81
In-Reply-To: <20210512074104.14180-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 12 May 2021 09:41:04 +0200")
References: <20210512074104.14180-1-peter@korsgaard.com>
Message-ID: <87a6ozjcqu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/cf7c4f360f5464c700788cc8299fd086544c80e8/build-end.log

 > Older GNU make versions don't like the explicit undefine.  It isn't really
 > needed as ifdef handles undefined and defined-to-the-empty-string the same
 > way, so just drop the undefine logic.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
