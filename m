From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 18 Sep 2008 10:57:42 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/aumix
In-Reply-To: <20080918084256.E277B3C64F@busybox.net> (egtvedt@uclibc.org's
	message of "Thu\, 18 Sep 2008 01\:42\:56 -0700 \(PDT\)")
References: <20080918084256.E277B3C64F@busybox.net>
Message-ID: <87bpylq1a1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "egtvedt" == egtvedt  <egtvedt@uclibc.org> writes:

Hi,

 egtvedt> Log:
 egtvedt> aumix: fix install rule to target to support multiple projects

 egtvedt> This patch will let aumix depend on an installed file on the
 egtvedt> target root file system instead of touched file.

How about converting it to Makefile.autotools.in while you're at it?
;)

-- 
Bye, Peter Korsgaard
