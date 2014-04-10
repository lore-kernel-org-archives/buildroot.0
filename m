From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2014 22:43:17 +0200
Subject: [Buildroot] [PATCH 1/1] erlang: bump version to 17.0
In-Reply-To: <1397140525-15130-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Thu, 10 Apr 2014 10:35:25 -0400")
References: <1397140525-15130-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <877g6w7w62.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > Erlang/OTP 17.0 is a new major release with new features, characteristics
 > improvements, as well as some minor incompatibilities.

 > Some highlights of the release are:
 >   - Erlang/OTP has been ported to the realtime operating system OSE.
 >   - Maps, a new dictionary data type (experimental)
 >   - A more natural mapping from ASN.1 OCTET STRING and BIT STRING to Erlang
 >     types, and other ASN.1 improvements and optimizations
 >   - The {active, N} socket option for TCP, UDP, and SCTP
 >   - A new (optional) scheduler utilization balancing mechanism
 >   - Migration of memory carriers has been enabled by default on all ERTS
 >     internal memory allocators
 >   - Increased garbage collection tenure rate
 >   - Experimental "dirty schedulers" functionality
 >   - Funs can now be given names
 >   - Miscellaneous unicode support enhancements
 >   - A new version scheme for OTP its applications has been introduced

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
