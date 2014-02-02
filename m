From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Feb 2014 11:25:04 +0100
Subject: [Buildroot] [PATCH 1/1] zxing: don't select libiconv
In-Reply-To: <1391288581-17748-1-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Sat, 1 Feb 2014 21:03:01 +0000")
References: <1391288581-17748-1-git-send-email-martin@barkynet.com>
Message-ID: <87ha8hrev3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > The zxing package currently selects libiconv when locale support is not
 > available in the toolchain.  This patch stops the zxing package selecting
 > libiconv.  The zxing package now uses uses libiconv if it's available
 > otherwise iconv support is disabled in zxing.

 > Signed-off-by: Martin Bark <martin@barkynet.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
