From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Apr 2019 10:01:09 +0200
Subject: [Buildroot] [PATCH] gnutls: security bump to 3.6.7.1
In-Reply-To: <20190403061405.27273-1-stefan.sorensen@spectralink.com>
 (=?utf-8?Q?=22S=C3=B8rensen=2C?= Stefan"'s message of "Wed, 3 Apr 2019
 06:14:32 +0000")
References: <20190403061405.27273-1-stefan.sorensen@spectralink.com>
Message-ID: <87h8bffrga.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?rensen," == S?rensen, Stefan <Stefan.Sorensen@spectralink.com> writes:

 > Fixes the following security issues:
 >  * CVE-2019-3836: It was discovered in gnutls before version 3.6.7 upstream
 >    that there is an uninitialized pointer access in gnutls versions 3.6.3 or
 >    later which can be triggered by certain post-handshake messages

 >  * CVE-2019-3829: A vulnerability was found in gnutls versions from 3.5.8
 >    before 3.6.7. A memory corruption (double free) vulnerability in the
 >    certificate verification API. Any client or server application that
 >    verifies X.509 certificates with GnuTLS 3.5.8 or later is affected.

These issues were fixed in 3.6.7, weren't they? I don't see 3.6.7.1
announced yet, what is the delta?

-- 
Bye, Peter Korsgaard
