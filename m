From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Jan 2013 23:56:00 +0100
Subject: [Buildroot] [PATCH] busybox: add 1.21.x series
In-Reply-To: <50FDC43E.5020903@zacarias.com.ar> (Gustavo Zacarias's message of
 "Mon, 21 Jan 2013 19:42:06 -0300")
References: <1358806463-14501-1-git-send-email-gustavo@zacarias.com.ar>
 <87libm88jo.fsf@dell.be.48ers.dk> <50FDC43E.5020903@zacarias.com.ar>
Message-ID: <87a9s26t8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 01/21/2013 07:39 PM, Peter Korsgaard wrote:
 >> Ahh come on, don't like my syslog-to-kmsg feature? ;)

 Gustavo> Hahaha :)

 Gustavo> Kernel 3.5+ doesn't sound friendly with some of the same
 Gustavo> configurations like qemu-sh4-r2d (blame Qemu for lack of FIFO
 Gustavo> support that kernels newer than 3.2.x use).  Regards.

3.5+ support is only needed to be able to store the full syslog facility
in the kernel log. It still works (with level only) on earlier kernels.

-- 
Bye, Peter Korsgaard
