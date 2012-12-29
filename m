From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 15:42:26 +0100
Subject: [Buildroot] Documentation improvements
Message-ID: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Samuel,

Here is a set of patches that add more details in the documentation
about /dev management, init systems and toolchain configuration, as
per our discussion a few days ago on IRC.

Besides adding information, I've also reorganized things a bit. I
think the "Embedded basics" subsection was really misplaced in "Going
further in Buildroot?s innards" section. Knowing the basics is really
not something that should be in the "Going further" part.

So what I've done is create a "Details of Buildroot configuration"
sub-section in the "Working with Buildroot" section (chapter 3), and
I've reorganized here the information coming from "Embedded
basics". I've removed a few things that are really not Buildroot
specific, and I've extended that with more details on toolchain, /dev
and init.

I also include some unrelated minor fixes to the documentation, as
separate patches.

Thanks!

Thomas
