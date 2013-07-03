From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 09:00:38 +0200
Subject: [Buildroot] [PATCH 04/23] toolchain/gcc: remove dead code
	related to host binary stripping
In-Reply-To: <1372620553-11416-5-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:28:54 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87r4fgqga1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The GCC_STRIP_HOST_BINARIES variable was always defined to
 Thomas> 'nope', which means that the host binaries were never
 Thomas> stripped. Get rid of the corresponding code, which is not in
 Thomas> use.

Committed, thanks.

-- 
Bye, Peter Korsgaard
