From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Dec 2017 10:43:40 +0100
Subject: [Buildroot] [PATCH-2017.02.x] nodejs: security bump to version
 6.12.2
In-Reply-To: <20171230233432.29998-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 31 Dec 2017 00:34:32 +0100")
References: <20171230233432.29998-1-peter@korsgaard.com>
Message-ID: <87vagngrlf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-15896 - Node.js was affected by OpenSSL vulnerability
 > CVE-2017-3737 in regards to the use of SSL_read() due to TLS handshake
 > failure.  The result was that an active network attacker could send
 > application data to Node.js using the TLS or HTTP2 modules in a way that
 > bypassed TLS authentication and encryption.

 > For more details, see the announcement:
 > https://nodejs.org/en/blog/vulnerability/december-2017-security-releases/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
