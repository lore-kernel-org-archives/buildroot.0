From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:15:47 +0200
Subject: [Buildroot] [PATCH] ghostscript: add upstream security fixes
	for CVE-2017-8291
In-Reply-To: <20170428074930.26043-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 28 Apr 2017 09:49:30 +0200")
References: <20170428074930.26043-1-peter@korsgaard.com>
Message-ID: <87k264iv7w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > CVE-2017-8291 - Artifex Ghostscript through 2017-04-26 allows -dSAFER bypass
 > and remote command execution via a "/OutputFile (%pipe%" substring in a
 > crafted .eps document that is an input to the gs program, as exploited in
 > the wild in April 2017.

 > For more details, see https://bugzilla.suse.com/show_bug.cgi?id=1036453

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
