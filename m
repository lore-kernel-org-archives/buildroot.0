From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Aug 2014 10:08:08 +0200
Subject: [Buildroot] [PATCH] openssl: add fix for hash cryptodev
	offloading
In-Reply-To: <1407273911-30628-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 5 Aug 2014 18:25:11 -0300")
References: <1407273911-30628-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r40q84rb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > See http://rt.openssl.org/Ticket/Display.html?id=2770&user=guest&pass=guest
 > This has been sitting for ages in the openssl tracker and it's verified
 > to cause issues.
 > The patch only touches cryptodev engine offloading so it's pretty safe.
 > Tested on CAAM SEC4 hardware.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
