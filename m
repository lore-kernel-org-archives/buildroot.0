From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Dec 2012 22:43:02 +0100
Subject: [Buildroot] Documentation improvements
In-Reply-To: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 29 Dec 2012 15:42:26 +0100")
References: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vcbkttzt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello Samuel,
 Thomas> Here is a set of patches that add more details in the documentation
 Thomas> about /dev management, init systems and toolchain configuration, as
 Thomas> per our discussion a few days ago on IRC.

 Thomas> Besides adding information, I've also reorganized things a bit. I
 Thomas> think the "Embedded basics" subsection was really misplaced in "Going
 Thomas> further in Buildroot?s innards" section. Knowing the basics is really
 Thomas> not something that should be in the "Going further" part.

 Thomas> So what I've done is create a "Details of Buildroot configuration"
 Thomas> sub-section in the "Working with Buildroot" section (chapter 3), and
 Thomas> I've reorganized here the information coming from "Embedded
 Thomas> basics". I've removed a few things that are really not Buildroot
 Thomas> specific, and I've extended that with more details on toolchain, /dev
 Thomas> and init.

 Thomas> I also include some unrelated minor fixes to the documentation, as
 Thomas> separate patches.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
