From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 00:08:51 +0100
Subject: [Buildroot] [PATCH v1] gstreamer1: fix riscv64 compile
In-Reply-To: <20181112192320.20532-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Mon, 12 Nov 2018 20:23:20 +0100")
References: <20181112192320.20532-1-ps.report@gmx.net>
Message-ID: <87sh0551x8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add upstream patch [1]:
 >   gstconfig.h.in: initial RISC-V support

 > Fixes [2]:

 >   ../gst/gstconfig.h:112:4: error: #error "Could not detect architecture; don't know whether it supports unaligned access! Please file a bug."

 > [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/commit/8a156d1725ecd03f2e8cdc8874e081dda2d3b43d
 > [2] http://autobuild.buildroot.net/results/07efafadff75ae2fb1d2b8d420be72345906af6c

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
