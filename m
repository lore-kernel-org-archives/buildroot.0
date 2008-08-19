From: Tomasz Chmielewski <mangoo@wpkg.org>
Date: Tue, 19 Aug 2008 17:34:42 +0200
Subject: [Buildroot] ARM EABI toolchain - anyone build it successfully?
Message-ID: <48AAE812.4020706@wpkg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm trying to make ARM EABI toolchain using the latest snapshot of 
Buildroot.
However, no matter which options I use (thread library implementation, 
uClibc version etc.) I'm only able to build GCC (4.3.1).

Then, it breaks later on on building uClibc.

I also tried building uClibc from nptl branch, but it also failed.

As different thread library implementations and uClibc versions give 
different errors, I won't paste it here, unless requested.

So my question - did anyone manage to build ARM EABI toolchain with 
buildroot (GCC 4.3.1 + uClibc; I also need busybox)?


-- 
Tomasz Chmielewski
http://wpkg.org
