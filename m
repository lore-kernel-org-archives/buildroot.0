From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 30 Apr 2019 12:23:40 +0200
Subject: [Buildroot] Buildroot does not try to find/use the system-installed
 meson
Message-ID: <CADYdroNf-GCbQVe5bZ1SU4D4aphJbnWPL_phiSLxLZb8DCv9wQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

even though I have very recent meson installed, buildroot will go to
great lengths to build everything from source (including host-python3,
host-ninja and host-python which is a dependency of host-ninja for
some reason).
Is there a good reason for this, or is this just a lacking feature for now?

I am pretty sure the system meson would do the same thing, and would
only need the crosscompile configuration (as its done with CMake).

regards, Norbert
