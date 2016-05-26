From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 May 2016 15:47:54 +0200
Subject: [Buildroot] [PATCH] lirc-tools: add patch to fix parallel build
	issue
In-Reply-To: <1464184800-25714-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 25 May 2016 16:00:00 +0200")
References: <1464184800-25714-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87pos953sl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The lirc-tools package fails to build once in a while in the
 > autobuilders. Some quick analysis of the problematic Makefile.am has
 > revealed one issue. However, since the issue is difficult to
 > reproduce, we could only check that the new solution continue to work,
 > and we're not 100% sure it fixes the entire problem: only the
 > autobuilders can say, over time.

 > Supposedly fixes:

 >   http://autobuild.buildroot.org/results/eb47d57de8182d25b1dacbf0ac3726ed20063d04/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
