From: Peter Korsgaard <peter.korsgaard@barco.com>
Date: Thu, 24 May 2007 23:26:03 +0200
Subject: [Buildroot] Typo:  /toolchain/gcc/gcc-uclibc-3.x.mk
In-Reply-To: <4655E76C.2040405@hi.is> (Petur Thors's message of "Thu, 24 May
	2007 19:28:44 +0000")
References: <4655E76C.2040405@hi.is>
Message-ID: <87hcq1q5g4.fsf@sleipner.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "PT" == Petur Thors <peturth@hi.is> writes:

PT> Hi Just bumped into a typo in
PT> buildroot/toolchain/gcc/gcc-uclibc-3.x.mk which (obviously) breaks
PT> the build : libstc++.so* instead of libstdc++.so* :)

Argh, sorry about that - Fixed in r18686.

-- 
Bye, Peter Korsgaard
