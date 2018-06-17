From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:57:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 version 8.11.3
In-Reply-To: <20180616224408.31434-1-martin@barkynet.com> (Martin Bark's
 message of "Sat, 16 Jun 2018 23:44:08 +0100")
References: <20180616224408.31434-1-martin@barkynet.com>
Message-ID: <87a7rtmmnm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > Fixes the following security issues:
 > - (CVE-2018-7167): Fixes Denial of Service vulnerability where calling
 >   Buffer.fill() could hang

 > - (CVE-2018-7161): Fixes Denial of Service vulnerability by updating the
 >   http2 implementation to not crash under certain circumstances during
 >   cleanup

 > - (CVE-2018-1000168): Fixes Denial of Service vulnerability by upgrading
 >   nghttp2 to 1.32.0

 > See https://nodejs.org/en/blog/release/v8.11.3/ for more details

 > Signed-off-by: Martin Bark <martin@barkynet.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
