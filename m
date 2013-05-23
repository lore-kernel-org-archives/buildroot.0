From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 May 2013 23:36:17 +0200
Subject: [Buildroot] [PATCH] poco: not available for all architectures
In-Reply-To: <1368704401-1832-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 16 May 2013 08:40:01 -0300")
References: <1368704401-1832-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871u8xidke.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Missing defines for:
 Gustavo> aarch64, arc, blackfin, microblaze & xtensa.
 Gustavo> Not properly supported: mips - only defines generic mips as BE, doesn't
 Gustavo> know about mipsel (LE) thus assuming it's BE.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/9847702b046bed59b07f0e075a58b1f31e9236ce/

 Gustavo> This should be pretty straightforward to fix in
 Gustavo> Foundation/include/Poco/Platform.h for interested parties
 Gustavo> since it only cares about endianness.

Committed, thanks.

-- 
Bye, Peter Korsgaard
