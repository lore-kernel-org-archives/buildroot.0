From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jan 2013 22:12:35 +0100
Subject: [Buildroot] [PATCH] configs/at91rm9200df: update and fix
In-Reply-To: <1357312426-9544-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 4 Jan 2013 12:13:46 -0300")
References: <1357312426-9544-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vcbclkjg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Update to the latest maxim.org.za kernel 2.6.38
 Gustavo> Lock down headers version, otherwise we were building a toolchain with
 Gustavo> 3.7 headers for a 2.6.33 kernel - not too wise.
 Gustavo> Also the AT91RM9200 is an ARM920T so enable that target.

Committed, thanks.

-- 
Bye, Peter Korsgaard
