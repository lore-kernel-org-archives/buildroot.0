From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 21 Mar 2020 21:06:04 +0100
Subject: [Buildroot] [PATCH v2] package/util-linux: fix build for
 riscv64 and powerpc64le
In-Reply-To: <20200313010611.17176-1-unixmania@gmail.com> (unixmania's message
 of "Thu, 12 Mar 2020 22:06:11 -0300")
References: <20200313010611.17176-1-unixmania@gmail.com>
Message-ID: <87lfnt4gnn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Pull two upstream patches that fix the declaration of pidfd_open and
 > pidfd_send_signal.

 > Fixes:
 >   http://autobuild.buildroot.net/results/2396b04478f9d358b94f2e2e05540625ddc9f205/
 >   http://autobuild.buildroot.net/results/ed4b5ec61bd33d3ccf0ebb16000af46d0499366d/

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 > ---
 > Chanves v1->v2: add SOB to patches

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
