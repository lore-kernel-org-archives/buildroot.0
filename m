From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Mar 2012 22:36:07 +0100
Subject: [Buildroot] [PATCH 1/2] linux-firmware: update definition for
	atheros ar9271
In-Reply-To: <1330713810-12947-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 2 Mar 2012 15:43:29 -0300")
References: <1330713810-12947-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8762e4p6t4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> ar9271.fw is the old convention for the firmware.  Starting
 Gustavo> with kernel 3.0 the new convention is htc_9271.fw which is a
 Gustavo> newer version of the firmware so symlinking won't do it and
 Gustavo> there are no guarantees that the newer firmware will work with
 Gustavo> the older driver either.

Committed, thanks.

-- 
Bye, Peter Korsgaard
