From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 10:39:02 +0200
Subject: [Buildroot] lame linking issue
In-Reply-To: <4E0DD227.6050807@visionsystems.de> (Yegor Yefremov's message of
 "Fri, 01 Jul 2011 15:56:55 +0200")
References: <4E0DD227.6050807@visionsystems.de>
Message-ID: <87hb71xgt5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> I'm using the latest git version of BR and wanted to build lame-3.98.4. During linking phase I got following errors:

 Yegor> Any idea? 

 Yegor> Some toolchain details:

 Yegor> uClibc: 0.9.32
 Yegor> GCC: 4.6.1

gcc 4.6.x support is experimental. Lame builds here with the default
(4.3.x) compiler.

-- 
Bye, Peter Korsgaard
