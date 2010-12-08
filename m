From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Dec 2010 22:55:04 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	for-2011.02/fix-ccache-support
In-Reply-To: <cover.1291752554.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 7 Dec 2010 21:09:55 +0100")
References: <cover.1291752554.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ipz4q69z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Changes since last post:
 Thomas>  * Fixed the documentation to not advertise a x2 speed-up

 Thomas>  * Fixed the documentation to not mention that ccache is inside the
 Thomas>    toolchain.

 Thomas>  * Fixed package/ccache/Config.in with a proper description, correct
 Thomas>    link

 Thomas>  * Add final newlines

 Thomas>  * Export HOSTCXX_NOCCACHE just like we export HOSTCC_NOCCACHE.

Thanks, committed.

-- 
Bye, Peter Korsgaard
