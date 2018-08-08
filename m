From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Aug 2018 16:28:02 +0200
Subject: [Buildroot] [PATCH] uclibc: ldso/arc: fix LD_DEBUG segv when
 printing R_ARC_NONE
In-Reply-To: <20180807173359.35041-1-abrodkin@synopsys.com> (Alexey Brodkin's
 message of "Tue, 7 Aug 2018 20:33:59 +0300")
References: <20180807173359.35041-1-abrodkin@synopsys.com>
Message-ID: <87y3dhexvx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > Dynamic linker used to segfault on attempt to print info
 > about R_ARC_NONE reloaction.

 > The fix is already in upstream master [1],
 > should be removed on uClibc version bump.

 > [1] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=269a2a2a0f863e1b43dc02f2f4f0f3c50299456e

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
