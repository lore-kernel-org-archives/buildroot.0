From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Mar 2012 22:13:44 +0100
Subject: [Buildroot] Linaro 2012.02 toolchain: pixman build failure
In-Reply-To: <4F58CEB4.6040908@visionsystems.de> (Yegor Yefremov's message of
 "Thu, 08 Mar 2012 16:22:28 +0100")
References: <4F58C7D9.2080205@visionsystems.de>
 <20120308155700.033c9f81@eb-e6520> <4F58CEB4.6040908@visionsystems.de>
Message-ID: <87mx7qeqyf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 >>> Any idea?
 >>> 
 >> try to add : --disable-arm-iwmmxt to configure

 Yegor> Thanks. It is working now. Peter, should we make a patch?

I guess so, but for what configurations? What is the problem exactly?
That the iwmmxt code doesn't work in thumb2 mode?

-- 
Bye, Peter Korsgaard
