From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Dec 2012 14:25:18 +0100
Subject: [Buildroot] [PATCH 1/2] nettle: fix missing link to libm
In-Reply-To: <1356781956-19977-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 29 Dec 2012 08:52:35 -0300")
References: <1356781956-19977-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqw1vvlt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> nettle-benchmark uses ldexp without explicitly linking to libm, fixes:
 Gustavo> http://autobuild.buildroot.net/results/c8e64fabcb98b1ff4bf737e2181b7cf2ae731550

Committed both, thanks.

-- 
Bye, Peter Korsgaard
