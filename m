From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Mar 2018 17:19:28 +0100
Subject: [Buildroot] [PATCH 1/3] board/qemu/ppc64le-pseries: use
 qemu-system-ppc64
In-Reply-To: <20180303143653.16934-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 3 Mar 2018 15:36:51 +0100")
References: <20180303143653.16934-1-thomas.petazzoni@bootlin.com>
Message-ID: <87inadb08f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > qemu-system-ppc64le doesn't necessarily exist: it isn't installed by
 > Qemu, and only created as a symlink to qemu-system-ppc64 by some
 > distributions (Ubuntu). Other distributions (Fedora) just have
 > qemu-system-ppc64.

 > But qemu-system-ppc64 is capable of running little-endian PPC64
 > systems, so use this one instead.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
