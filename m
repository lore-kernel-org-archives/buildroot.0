From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Nov 2013 16:06:28 +0100
Subject: [Buildroot] [PATCH] php: fix iconv related build failure
In-Reply-To: <1385470264-17180-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 26 Nov 2013 09:51:04 -0300")
References: <1385470264-17180-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a9grjj7v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fix a rare edge build failure when iconv is enabled, easily reproduced
 > in a debian chroot with an aarch64 external toolchain with iconv +
 > xmlrpc support enabled with a php cgi + cli target.
 > Should solve bug #6500.

Committed, thanks.

-- 
Bye, Peter Korsgaard
