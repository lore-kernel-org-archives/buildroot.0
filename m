From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2020 23:56:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: security bump to
 v1.1.1g
In-Reply-To: <20200421133651.6921-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Tue, 21 Apr 2020 15:36:51 +0200")
References: <20200421133651.6921-1-titouan.christophe@railnova.eu>
Message-ID: <87tv0rtnn0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > This fixes CVE-2020-1967:
 > Server or client applications that call the SSL_check_chain() function during
 > or after a TLS 1.3 handshake may crash due to a NULL pointer dereference as a
 > result of incorrect handling of the "signature_algorithms_cert" TLS extension.
 > The crash occurs if an invalid or unrecognised signature algorithm is received
 > from the peer. This could be exploited by a malicious peer in a Denial of
 > Service attack. OpenSSL version 1.1.1d, 1.1.1e, and 1.1.1f are affected by this
 > issue. This issue did not affect OpenSSL versions prior to 1.1.1d.

 > See https://www.openssl.org/news/secadv/20200421.txt

 > Also update the hash file to the new two spaces convention

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
