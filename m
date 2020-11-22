From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:33:02 +0100
Subject: [Buildroot] [PATCH] package/libkrb5: security bump to version
 1.18.3
In-Reply-To: <20201121232149.7823-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 22 Nov 2020 00:21:49 +0100")
References: <20201121232149.7823-1-peter@korsgaard.com>
Message-ID: <87k0udv4v5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2020-28196: MIT Kerberos 5 (aka krb5) before 1.17.2 and 1.18.x before
 >   1.18.3 allows unbounded recursion via an ASN.1-encoded Kerberos message
 >   because the lib/krb5/asn.1/asn1_encode.c support for BER indefinite
 >   lengths lacks a recursion limit.

 > Also fix .hash file indentation.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
