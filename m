From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 20:57:03 +0100
Subject: [Buildroot] [PATCH 1/2] package/gcc: remove uclibc-conf patch
In-Reply-To: <20181208190619.9977-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 8 Dec 2018 20:06:18 +0100")
References: <20181208190619.9977-1-romain.naour@gmail.com>
Message-ID: <877egj4ws0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > This patch is present in Buildroot since a long time and has been
 > rebased onver several version of gcc without beeing upstreamed.
 > Also it only concern contrib/regression, which is not used at all
 > during the build...

 > As suggested by Arnout [1], a test based on qemu_x86_defconfig has
 > been done without this patch and there is no regression.

 > [1] http://lists.busybox.net/pipermail/buildroot/2018-May/222104.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
