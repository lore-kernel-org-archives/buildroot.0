From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Dec 2019 13:52:55 +0100
Subject: [Buildroot] [PATCH 1/3] package/binutils: add binutils 2.33.1
In-Reply-To: <20191130151752.419756-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 30 Nov 2019 16:17:50 +0100")
References: <20191130151752.419756-1-romain.naour@gmail.com>
Message-ID: <8736e2ris8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Keep sh-conf and poison-system-directories patches.
 > Remove xtensa patches already in this version [1] [2] [3].

 > Revert an upstream patch since it prevent booting a sh4 system under
 > Qemu as reported on the Binutils mailing list [5] [6].
 > This commit is not related to sh4, it's weird that it is the
 > only affected architecture.

 > [1] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=2487ef07c28b961c6e2b8c51161f88f93b181d07
 > [2] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=403b0b61f6d4358aee8493cb1d11814e368942c9
 > [3] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=548791769dc737f05cb12e5ee4190b7e853beac9
 > [4] https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=ebd2263ba9a9124d93bbc0ece63d7e0fae89b40e
 > [5] https://sourceware.org/ml/binutils/2019-10/msg00105.html
 > [6] https://sourceware.org/ml/binutils/2019-11/msg00407.html

 > See:
 > https://www.sourceware.org/ml/binutils/2019-10/msg00103.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
