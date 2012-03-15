From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Mar 2012 21:40:11 +0100
Subject: [Buildroot] vsftpd
In-Reply-To: <4F6211CF.7030701@visionsystems.de> (Yegor Yefremov's message of
 "Thu, 15 Mar 2012 16:59:11 +0100")
References: <CALo-6+jE0XhxMv2xO-EtOLjnrwR8DC9DPH5U0zeV6qst_F-WaQ@mail.gmail.com>
 <4F6211CF.7030701@visionsystems.de>
Message-ID: <87ehstsims.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 Yegor> Do we have inetd/xinetd? Can't find
 Yegor> them. http://en.wikipedia.org/wiki/Xinetd seems to be
 Yegor> unsupported. What is the modern way of running daemons on
 Yegor> demand-?

Busybox has an inetd applet, but we don't have any of the standalone
versions, if that's what you mean.

 Yegor> By the way, I have trouble compiling vsftpd at least with the
 Yegor> latest linaro toolchain (haven't tried other toolchains so far):

It works here with the default internal arm toolchain, but I haven't
tried with the linaro one.

-- 
Bye, Peter Korsgaard
