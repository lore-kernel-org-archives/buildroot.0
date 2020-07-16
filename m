From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:01:38 +0200
Subject: [Buildroot] [PATCH] package/gnutls: security bump to 3.6.14
In-Reply-To: <20200611053151.709390-1-stefan.sorensen@spectralink.com>
 (stefan's message of "Thu, 11 Jun 2020 07:31:51 +0200")
References: <20200611053151.709390-1-stefan.sorensen@spectralink.com>
Message-ID: <87y2njv6zx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "stefan" == stefan  <stefan@astylos.dk> writes:

 > From: Stefan S?rensen <stefan.sorensen@spectralink.com>
 > Fixes the following security issue:

 >  * CVE-2020-13777: It was found that GnuTLS 3.6.4 introduced a
 >    regression in the TLS protocol implementation. This caused the TLS
 >    server to not securely construct a session ticket encryption key
 >    considering the application supplied secret, allowing a MitM
 >    attacker to bypass authentication in TLS 1.3 and recover previous
 >    conversations in TLS 1.2

 > Release announcement:
 >  https://lists.gnupg.org/pipermail/gnutls-help/2020-June/004648.html

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
