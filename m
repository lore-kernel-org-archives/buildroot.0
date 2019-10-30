From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 09:55:56 +0100
Subject: [Buildroot] [PATCH] package/qemu: bump to a hot-fix release
 3.1.1.1
In-Reply-To: <20191015154104.13171-1-abrodkin@synopsys.com> (Alexey Brodkin's
 message of "Tue, 15 Oct 2019 18:41:04 +0300")
References: <20191015154104.13171-1-abrodkin@synopsys.com>
Message-ID: <87pnie4noj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Fixes a couple of important things and among other things pvrdma
 > compila:
 -----------------------> 8---------------------
 >   In function 'create_qp':
 >   hw/rdma/vmw/pvrdma_cmd.c:517:16: error: 'rc' undeclared
 -----------------------> 8---------------------

 > Bumped into this build problem while building vanilla
 > qemu_arm_versatile_defconfig.

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Alexander Dahl <post@lespocky.de>
 > Cc: Adam Duskett <Aduskett@gmail.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
