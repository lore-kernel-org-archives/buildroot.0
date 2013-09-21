From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 21 Sep 2013 16:58:34 +0200
Subject: [Buildroot] [PATCH] zeromq: remove unneeded patch after version
	bump
In-Reply-To: <1379750738-6358-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 21 Sep 2013 10:05:38 +0200")
References: <1379750738-6358-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878uyqb4rp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Commit b3c525b886b375256a8e0d60a749ea07f6591974 has bumped zeromq to
 Thomas> version 2.3.4, which makes the patch
 Thomas> zeromq-0001-test-collect-delay-end-of-line.patch unneeded since it has
 Thomas> been merged upstream.

 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.org/results/e8c/e8c8ba8c31fd081c34c8772790d4c581eb3ec3ed/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
