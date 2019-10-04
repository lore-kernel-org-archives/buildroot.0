From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Oct 2019 21:24:37 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: GCC bug 68485
In-Reply-To: <20190527210510.70987-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Mon, 27 May 2019 23:05:09 +0200")
References: <20190527210510.70987-1-giulio.benetti@micronovasrl.com>
Message-ID: <87r23s1fgq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > GCC <= 9.x hangs while building brotli for the Microblaze Arch:
 > http://autobuild.buildroot.net/results/d86/d86251974a0a348a64d9a1d1fd7d02dd4aff0792/

 > Reported:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485

 > Still not fixed. Every Microblaze Gcc version <= 9.x is affected.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
