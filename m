From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 22:19:09 +0100
Subject: [Buildroot] [PATCH] configs: rename rpi_defconfig for
	consistency
In-Reply-To: <1384085782-32685-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 10 Nov 2013 13:16:22 +0100")
References: <1384085782-32685-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87r4aoc5v6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: mathieu benoit <mathieu.benoit@savoirfairelinux.com>
 > We name all of our boards and defconfig files based on the boards
 > fullname, not a nickname or a shortname.

 > 'rpi' is short for Raspberry Pi, so name all our Raspberry Pi ressource
 > with 'raspberrypi' instead of 'rpi'.

 > This should also help Buildroot-newcomers to recognise Raspberry Pi
 > related files (defconfig and board doc).

 > Signed-off-by: Mathieu Benoit <mathieu.benoit@savoirfairelinux.com>
 > [yann.morin.1998 at free.fr: reverse the rename]
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
