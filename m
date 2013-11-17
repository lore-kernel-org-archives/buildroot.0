From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Nov 2013 08:49:45 +0100
Subject: [Buildroot] [PATCH] wvstreams: remove tcl dependency support
In-Reply-To: <20131114225758.GA13765@gmail.com> (Andrew Ruder's message of
 "Thu, 14 Nov 2013 16:57:58 -0600")
References: <20131114225758.GA13765@gmail.com>
Message-ID: <87a9h3zcva.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Ruder <andrew.ruder@elecsyscorp.com> writes:

 > As far as I can tell enabling tcl support has no affect on the actual
 > library.  Furthermore, wvstreams has been checking for/linking against
 > tcl 8.3 which has never been supported in buildroot as far as I can tell
 > (8.4 added in 2005).  That being said there is clearly no reason to keep
 > this around.

 > Signed-off-by: Andrew Ruder <andrew.ruder@elecsyscorp.com>

Committed, thanks.

 > ---

 >  On a side-note, I am testing a few bigger patches to get expect 5.45
 >  and tcl 8.6.1 added/bumped.  I haven't done a decent amount of testing,
 >  but figured I'd get some of the smaller patches out of the way as I go.

Sounds good!

-- 
Bye, Peter Korsgaard
