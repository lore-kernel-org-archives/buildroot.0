From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Jul 2013 22:54:15 +0200
Subject: [Buildroot] [PATCH] libosip2: arc: Undefine __arc__ when
	building for ARC processors
In-Reply-To: <1373891962-32493-1-git-send-email-mjonker@synopsys.com> (Mischa
 Jonker's message of "Mon, 15 Jul 2013 14:39:22 +0200")
References: <1373891962-32493-1-git-send-email-mjonker@synopsys.com>
Message-ID: <87hafva6iw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mischa" == Mischa Jonker <Mischa.Jonker@synopsys.com> writes:

 Mischa> libosip2 appears to have support for the "ARC standard" (Advanced
 Mischa> RISC Computing), which is unrelated to Synopsys DesignWare ARC
 Mischa> processors. The check for this involves verifying the existence of
 Mischa> the "__arc__" macro. Unfortunately, this macro is also present
 Mischa> as a predefined built-in for the ARC processors, resulting into
 Mischa> build failures.

Committed with a short comment in the .mk file about why we're doing
this, thanks.

-- 
Bye, Peter Korsgaard
