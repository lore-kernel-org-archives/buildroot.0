From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 May 2013 22:31:15 +0200
Subject: [Buildroot] [PATCH v2] mongrel2: Needs a {e,
	}glibc or a uClibc-0.9.34-git based toolchain
In-Reply-To: <1369326481-18848-1-git-send-email-markos.chandras@gmail.com>
 (Markos Chandras's message of "Thu, 23 May 2013 17:28:01 +0100")
References: <1369326481-18848-1-git-send-email-markos.chandras@gmail.com>
Message-ID: <8738tdjv58.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> mongrel2 needs the {get,make,swap}context functions which are
 Markos> present in {e,}glibc and in the uClibc's master branch.

 Markos> Fixes:
 Markos> http://autobuild.buildroot.net/results/8e132a2b03a7b5ae94199db7db86883c05dca700/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
