From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Feb 2014 16:47:32 +0100
Subject: [Buildroot] [PATCH v2 1/2] rt-tests: disable for uclibc mips
In-Reply-To: <1393110449-12710-1-git-send-email-rjbarnet@rockwellcollins.com>
 (Ryan Barnett's message of "Sun, 23 Feb 2014 00:07:28 +0100")
References: <1393110449-12710-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <87d2idq19n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > rt-tests is not supported by a uclibc toolchain that does not implement
 > _pid in struct sigevent. Currently this is all MIPS architectures
 > in uclibc.

 > Fixes:
 >   http://autobuild.buildroot.net/results/074/074265602bec4aba6c82d1aee389045e8ad33d4b

Committed both, thanks.

-- 
Bye, Peter Korsgaard
