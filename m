From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Oct 2017 22:08:35 +0200
Subject: [Buildroot] [PATCH] xlib_libXfont{,
	2}: add upstream security fixes
In-Reply-To: <20171010195830.526-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 10 Oct 2017 21:58:30 +0200")
References: <20171010195830.526-1-peter@korsgaard.com>
Message-ID: <87376kxjgc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-13720 - Check for end of string in PatternMatch

 > CVE-2017-13722 - pcfGetProperties: Check string boundaries

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
