From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Apr 2020 08:09:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnutls: security bump to 3.6.13
In-Reply-To: <20200407073644.2561937-1-stefan.sorensen@spectralink.com>
 ("Stefan =?utf-8?Q?S=C3=B8rensen=22's?= message of "Tue, 7 Apr 2020
 09:36:44 +0200")
References: <20200407073644.2561937-1-stefan.sorensen@spectralink.com>
Message-ID: <87mu7lgpgv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan S?rensen <stefan.sorensen@spectralink.com> writes:

 > Fixes the following security issue:
 >  * CVE-2020-11501: It was found that GnuTLS 3.6.3 introduced a
 >    regression in the DTLS protocol implementation. This caused the DTLS
 >    client to not contribute any randomness to the DTLS negotiation
 >    breaking the security guarantees of the DTLS protocol.

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
