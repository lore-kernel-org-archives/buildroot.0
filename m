From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 11:26:23 +0200
Subject: [Buildroot] [git commit branch/next] qemu: bump to 2.12.0
In-Reply-To: <20180810215115.706538B8DD@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Fri, 10 Aug 2018 23:57:23 +0200")
References: <20180810215115.706538B8DD@busybox.osuosl.org>
Message-ID: <87woqb7irk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=06e3957c16ae58745a29c56436c537170e246ea2
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

 > In addition:
 >   - Update 0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
 >     with new line numbers and file location.
 >   - Remove upstream 0002-memfd-fix-configure-test.patch
 >   - Add new options found in 2.12.0 in qemu.mk as disabled.
 >   - Remove --with-system-pixman as it's no longer optional.

 > Tested with test-pkg:

 > ./utils/test-pkg -p qemu -c configs/qemu_min_defconfig
 >                              br-arm-full [1/6]: OK
 >                   br-arm-cortex-a9-glibc [2/6]: OK
 >                    br-arm-cortex-m4-full [3/6]: SKIPPED
 >                           br-x86-64-musl [4/6]: OK
 >                       br-arm-full-static [5/6]: OK
 >                 armv5-ctng-linux-gnueabi [6/6]: OK
 > 6 builds, 1 skipped, 0 build failed, 0 legal-info failed

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
