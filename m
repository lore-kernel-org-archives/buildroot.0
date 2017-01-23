From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 23:07:57 +0100
Subject: [Buildroot] [PATCH 1/2] gdb: unbreak 7.12 target gdb/gdbserver
	build without C++ support
In-Reply-To: <20170122191710.22600-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 22 Jan 2017 20:17:09 +0100")
References: <20170122191710.22600-1-peter@korsgaard.com>
Message-ID: <87sho9ig5e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > gdb 7.12+ by default builds with a C++ compiler, which naturally doesn't
 > work when we don't have C++ support in the toolchain.

 > Fix it by passing --disable-build-with-cxx for such setups.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
