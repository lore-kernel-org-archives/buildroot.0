From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 08:36:44 +0100
Subject: [Buildroot] [PATCH 1/1] gstreamer: fix build on riscv
In-Reply-To: <20181117184533.21169-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Nov 2018 19:45:33 +0100")
References: <20181117184533.21169-1-fontaine.fabrice@gmail.com>
Message-ID: <878t1qq1kj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > RISC-V supports unaligned accesses, but these might run extremely slowly
 > depending on the implementation so set as_cv_unaligned_access to no on
 > this architecture, see:
 > https://gitlab.freedesktop.org/gstreamer/gstreamer/commit/8a156d1725ecd03f2e8cdc8874e081dda2d3b43d

 > Fixes:
 >  - http://autobuild.buildroot.org/results/dca32c929350311fca1a85e251d318b43c4a3177

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
