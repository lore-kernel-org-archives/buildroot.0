From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Jun 2021 21:01:46 +0200
Subject: [Buildroot] [PATCH for-next] package/gdb: enable nios2
In-Reply-To: <20210606131331.235096-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 6 Jun 2021 15:13:31 +0200")
References: <20210606131331.235096-1-romain.naour@gmail.com>
Message-ID: <87wnqn9h45.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > It turn out that gdb/gdbserver support for nios2 is available since 7.7 release, since commit [1] [2].
 > [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=a1217d97c4b0449d052fad3d2df2ab58b48f918c
 > [2] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=68f5f83833e21b8c8466fe852b403b81db227ce4

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 > git tag --contains a1217d97c4b0449d052fad3d2df2ab58b48f918c
 > returns gdb-7.7-release tag as the oldest containing this commit.

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
