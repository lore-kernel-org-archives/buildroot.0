From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 09 Dec 2012 21:47:14 +0100
Subject: [Buildroot] [PATCH] pkg-download.mk: fix multiple matches in
	shallow clone test
In-Reply-To: <1354847827-4902-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Thu, 6 Dec 2012 21:37:07 -0500")
References: <1354847827-4902-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <87mwxnvtpp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Move the git reference directly to git-ls-remote rather than
 Danomi> piping the output to grep, to help avoid reporting partial
 Danomi> matches rather than the actual requested reference.  Also,
 Danomi> add quotes to protest "test" from failing when multiple
 Danomi> strings are reported.

Committed, thanks.

-- 
Bye, Peter Korsgaard
