From: Mats Erik Andersson <mats.andersson64@comhem.se>
Date: Thu, 07 Jun 2007 19:08:54 +0200
Subject: [Buildroot] Why are recent 2.4.3* kernels ignored?
Message-ID: <1181236134.6170.14.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

caused by me wasting time today to arrange Buildroot
to accept a kernel 2.4.33.3, and also observing aldot's
svn-commit of today for defconfig of Buildroot -- his patching
that halts with kernel 2.4.31 of the previous series --
I am seriously wandering why kernels 2.4.33 and 2.4.34
are not being accepted as viable and natural targets
in the offered setup. Please, tell me!

My own accomodations for 2.4.33.3 forced me to do several
linking tricks and faked build flags (like .unpacked and
.configured) in order to position kernel header directories
where they are expected to be, and simultaneously keep my
previous kernel source directory. The major obstacle to
overcome seems to be the availability/extraction of header
files out of the kernel tar-ball. If most of us are so 
picky of only supplying the very most recent 2.6-kernel,
why not do the same with the 2.4-series?

Best regards,    Mats E Andersson
