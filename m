From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Apr 2021 08:59:00 +0200
Subject: [Buildroot] [PATCH 1/3] package/gcc: bump to version 10.3
In-Reply-To: <20210411094738.455891-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 11 Apr 2021 11:47:36 +0200")
References: <20210411094738.455891-1-romain.naour@gmail.com>
Message-ID: <87h7jusvd7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Remove upstream patch
 > https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=5aeabae7f0cdd8dd3a01103b68b2e7a66a71c685

 > Rebase the patch: Revert "re PR target/92095 (internal error with -O1 -mcpu=niagara2 -fPIE)"
 > Add the link to the bug report.

 > Tested with toolchain-builder:
 > https://gitlab.com/kubu93/toolchains-builder/-/pipelines/284176939

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
