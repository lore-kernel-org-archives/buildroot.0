From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Jul 2017 17:51:12 +0200
Subject: [Buildroot] [PATCH] libmad: add security patch from debian
In-Reply-To: <20170704084211.8696-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 4 Jul 2017 10:42:11 +0200")
References: <20170704084211.8696-1-peter@korsgaard.com>
Message-ID: <87h8ys19qn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > CVE-2017-8372 - The mad_layer_III function in layer3.c in Underbit MAD
 > libmad 0.15.1b, if NDEBUG is omitted, allows remote attackers to cause a
 > denial of service (assertion failure and application exit) via a crafted
 > audio file.

 > CVE-2017-8373 - The mad_layer_III function in layer3.c in Underbit MAD
 > libmad 0.15.1b allows remote attackers to cause a denial of service
 > (heap-based buffer overflow and application crash) or possibly have
 > unspecified other impact via a crafted audio file.

 > CVE-2017-8374 - The mad_bit_skip function in bit.c in Underbit MAD libmad
 > 0.15.1b allows remote attackers to cause a denial of service (heap-based
 > buffer over-read and application crash) via a crafted audio file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
