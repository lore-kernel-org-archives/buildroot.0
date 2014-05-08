From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 May 2014 23:47:26 +0200
Subject: [Buildroot] [PATCH v3] protobuf: fix build for some unsupported
	architectures
In-Reply-To: <20140508204850.GO3861@tarshish> (Baruch Siach's message of "Thu, 
 8 May 2014 23:48:50 +0300")
References: <7785bef8562b61c25931c80386ab9a60fe80459f.1399554410.git.baruch@tkos.co.il>
 <871tw4cauk.fsf@dell.be.48ers.dk> <20140508204850.GO3861@tarshish>
Message-ID: <87k39waqoh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> So it looks like we need to tweak the arch list a bit.

 > The generic internal atomic ops implementation (which is used to fix
 > powerpc build) is using the gcc feature of "memory model aware atomic
 > operations".  These were introduced in gcc 4.7, while the Sourcery
 > toolchain is gcc 4.5. I don't see a straightforward way to depend on
 > gcc version like we have for kernel headers. Any ideas?

Hmm, not really - No :/ So that makes the patch less interesting :/

-- 
Bye, Peter Korsgaard
