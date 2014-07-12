From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 12 Jul 2014 20:50:42 +0200
Subject: [Buildroot] Open bug overview: help wanted!
Message-ID: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a brief overview of the currently open bugs. Ideally we can
close many of them in the context of buildroot-2014.08.
Contributions in this area are more than welcome!

https://bugs.busybox.net/show_bug.cgi?id=7208 critical
unassigned at buildroot.uclibc.org Glibc C++ aplications crash if they
use exceptions.
This problem is caused by a patch adding musl support. How to proceed?

https://bugs.busybox.net/show_bug.cgi?id=7010 enhancement
unassigned at buildroot.uclibc.org jamvm builds and runs fine under mips
(be)
This problem will be solved once jamvm 1.6.0 is released. The
maintainer of Jamvm has promised this already for some time, but so
far the release hasn't been made yet.

https://bugs.busybox.net/show_bug.cgi?id=7154 major
patrickdepinguin at gmail.com Local uClibc config file gets overwritten
using make uclibc-update-config
I'm working on this.

https://bugs.busybox.net/show_bug.cgi?id=7124 major
thomas.petazzoni at free-electrons.com Use BR toolchain externally
results a non-bootable root filesystem
ThomasP: you assigned this bug to yourself, have you been able to
reproduce/analyze this already?

https://bugs.busybox.net/show_bug.cgi?id=7172 major
unassigned at buildroot.uclibc.org Name collision of rpath token
expansion and internal variables
The puzzle pieces for a solution are present in this bug report. All
it needs is someone caring enough to create a proper patch for this.
Any candidates?

https://bugs.busybox.net/show_bug.cgi?id=7250 minor
thomas.petazzoni at free-electrons.com Cannot build with -std=c++11
ThomasP attached a patch to the bug report, and the submitter
confirmed it to work. So I guess this patch can be submitted to the
list now?

https://bugs.busybox.net/show_bug.cgi?id=6944 minor
unassigned at buildroot.uclibc.org building toolchain for sh4 fails
ThomasP: you discussed this patch with the submitter, but there is no
final conclusion yet. How to proceed?

https://bugs.busybox.net/show_bug.cgi?id=6950 normal
gustavo at zacarias.com.ar Full unicode support in ncurses
Gustavo is working on this.

https://bugs.busybox.net/show_bug.cgi?id=4790 normal jacmet at uclibc.org
Running udhcpc on a system with NFS root kills NFS
We discussed this patch in the context of the last release cycle. I
believe the end conclusion is that we shouldn't try to be too smart
with respect to the init scripts/configuration files and instead
document the gotchas in the manual. Any takers?

https://bugs.busybox.net/show_bug.cgi?id=5900 normal
unassigned at buildroot.uclibc.org config flags to the Xenomai build
system ...
This problem should be investigated a little to see if there is
actually a problem or not, and if so where the problem is: in
buildroot or in Xenomai. Any takers?

https://bugs.busybox.net/show_bug.cgi?id=7262 normal
unassigned at buildroot.uclibc.org Generating locale en_US.UTF-8 fails on
64bit fedora linux host
Anyone willing to investigate this?

Then there are a number of bug reports that I currently care less about.
Several of them are related to new packages (no bugs), some of them
are there to indicate that certain packages are disabled on a given
configuration, and some are real problems.
Takers for these bugs?

6230 minor unassigned at buildroot.uclibc.org Cannot compile gcc without
threads (uClibc-based)
7118 enhancement abrodkin at synopsys.com Package "thrift" requires
atomic operations
3427 enhancement s.martin49 at gmail.com New package: nginx
261 enhancement unassigned at buildroot.uclibc.org New package: wxWidgets
325 enhancement unassigned at buildroot.uclibc.org New package: ratpoison
405 enhancement unassigned at buildroot.uclibc.org New package: OpenVZ tools
1309 enhancement unassigned at buildroot.uclibc.org New package: rdiff-backup
3655 enhancement unassigned at buildroot.uclibc.org New package: libav
3991 enhancement unassigned at buildroot.uclibc.org New Package:
open-vm-tools (Vmware Tools)
6878 minor abrodkin at synopsys.com dmraid: disabled on ARC
7088 minor sonic.zhang at analog.com elfutils on Blackfin doesn't build
6872 minor unassigned at buildroot.uclibc.org gpsd: disabled on microblaze
7136 normal thomas.petazzoni at free-electrons.com ecryptfs-utils needs
gettext to run when glibc/eglibc is used
7142 normal thomas.petazzoni at free-electrons.com ecryptfs needs getent to run


Best regards,
Thomas
