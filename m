From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 09:14:03 +0100
Subject: [Buildroot] [PATCH] wavpack: add upstream security fixes
In-Reply-To: <20180227212652.18759-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 27 Feb 2018 22:26:52 +0100")
References: <20180227212652.18759-1-peter@korsgaard.com>
Message-ID: <87inahlees.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-6767: A stack-based buffer over-read in the ParseRiffHeaderConfig
 > function of cli/riff.c file of WavPack 5.1.0 allows a remote attacker to
 > cause a denial-of-service attack or possibly have unspecified other impact
 > via a maliciously crafted RF64 file.

 > CVE-2018-7253: The ParseDsdiffHeaderConfig function of the cli/dsdiff.c file
 > of WavPack 5.1.0 allows a remote attacker to cause a denial-of-service
 > (heap-based buffer over-read) or possibly overwrite the heap via a
 > maliciously crafted DSDIFF file.

 > CVE-2018-7254: The ParseCaffHeaderConfig function of the cli/caff.c file of
 > WavPack 5.1.0 allows a remote attacker to cause a denial-of-service (global
 > buffer over-read), or possibly trigger a buffer overflow or incorrect memory
 > allocation, via a maliciously crafted CAF file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
