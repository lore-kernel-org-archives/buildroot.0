From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Jan 2013 00:10:34 +0100
Subject: [Buildroot] [PATCH] busybox: add 1.21.x series
In-Reply-To: <50FDC8E2.6070100@zacarias.com.ar> (Gustavo Zacarias's message of
 "Mon, 21 Jan 2013 20:01:54 -0300")
References: <1358806463-14501-1-git-send-email-gustavo@zacarias.com.ar>
 <87libm88jo.fsf@dell.be.48ers.dk> <50FDC43E.5020903@zacarias.com.ar>
 <87a9s26t8f.fsf@dell.be.48ers.dk> <50FDC8E2.6070100@zacarias.com.ar>
Message-ID: <87wqv65dzp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 01/21/2013 07:56 PM, Peter Korsgaard wrote:
 >> 3.5+ support is only needed to be able to store the full syslog facility
 >> in the kernel log. It still works (with level only) on earlier kernels.

 Gustavo> Ahhh my quick reading of it just got the 3.5+ part.
 Gustavo> I'm not a fan of mixing up userland & kernel logs but then again logread
 Gustavo> with the circular buffer doesn't give much choice about it anyway.
 Gustavo> Should i change that and resubmit or would you?

No, it was just a joke. I don't think there's any particular reason to
enable logread/log-to-kmsg in the default configs.

-- 
Bye, Peter Korsgaard
