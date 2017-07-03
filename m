From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 22:01:07 +0200
Subject: [Buildroot] [PATCH] libpwquality: select cracklib
In-Reply-To: <20170703165827.19052-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 3 Jul 2017 18:58:27 +0200")
References: <20170703165827.19052-1-peter@korsgaard.com>
Message-ID: <87tw2t5lz0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > libpwquality adds cracklib to its _DEPENDENCIES, but forgot to select it in
 > Config.in, leading to build failures if cracklib isn't explicitly enabled:

 > Makefile:536: *** cracklib is in the dependency chain of libpwquality that
 > has added it to its _DEPENDENCIES variable without selecting it or depending
 > on it from Config.in.  Stop.

 > No autobuilder references as this error happens before build-time.log is
 > written, causing the autobuilder to ignore the build result.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
