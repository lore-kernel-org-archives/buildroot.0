From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 11:40:39 +0200
Subject: [Buildroot] [PATCH 1/5] package/libwebsockets: remove
 dependency on mmu
In-Reply-To: <20200726022901.295552-2-aduskett@gmail.com> (aduskett's message
 of "Sat, 25 Jul 2020 19:28:57 -0700")
References: <20200726022901.295552-1-aduskett@gmail.com>
 <20200726022901.295552-2-aduskett@gmail.com>
Message-ID: <87blje9948.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Six years ago, commit b6b5bb518d28850e024b90db1129b7f86e9d416c added the MMU
 > dependency for the libwebsockets package. However, according to the git
 > history of the CMakeLists.txt file, libwebsockets has supported the vfork
 > function for at least the last five years.

 > After testing with the qemu_arm_versatile_nommu_defconfig and the
 > br-arm-cortex-m4-full.config file, no errors occurred when building
 > libwebsockets without MMU support.

 > Remove the dependency; it is no longer necessary.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
