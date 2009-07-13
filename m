From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Jul 2009 09:23:20 +0200
Subject: [Buildroot] [PATCH] Change ruby version to 1.9.1-p129
In-Reply-To: <1247141331-8609-1-git-send-email-laurent.laffont@gmail.com>
	(laurent laffont's message of "Thu\, 9 Jul 2009 14\:08\:51 +0200")
References: <1247141331-8609-1-git-send-email-laurent.laffont@gmail.com>
Message-ID: <87ws6d82s7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "laurent" == laurent laffont <laurent.laffont@gmail.com> writes:

Hi,

 laurent> From: laurent laffont <laurent.laffont@gmail.com>
 laurent> Ruby 1.9.1 handle cross compilation better, espescially extensions (I'm working on ARM at91sam9263-ek).
 laurent> This patch also disable ruby doc generation and ipv6.

We have a DISABLE_IPV6 to handle ipv6 enable/disable, but otherwise it
looks good - Committed.

Thanks!

-- 
Bye, Peter Korsgaard
