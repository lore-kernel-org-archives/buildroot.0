From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 03 Jul 2013 23:51:35 +0200
Subject: [Buildroot] [git commit] kmod: bump version
In-Reply-To: <20130703234907.3c4c944e@skate> (Thomas Petazzoni's message of
 "Wed, 3 Jul 2013 23:49:07 +0200")
References: <20130703194340.D760E9A19A@busybox.osuosl.org>
 <20130703232625.08b7fe54@skate> <8761wrpbrt.fsf@dell.be.48ers.dk>
 <20130703234907.3c4c944e@skate>
Message-ID: <87bo6jnwgo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Or, as we discussed when talking about building with -fPIC: build
 Thomas> static /and/ dynamic, build dynamic only (default), build static only.

Yes, I completely agree. I'll fix it once I'm done with your toolchain
series.


 Thomas> Indeed. I must say I'm somewhat surprised that something relatively
 Thomas> simple like kmod doesn't support static linking.

Indeed. It seems to be because of policy rather than anything technical:

https://git.kernel.org/cgit/utils/kernel/kmod/kmod.git/commit/?id=b7016153ec8

-- 
Bye, Peter Korsgaard
