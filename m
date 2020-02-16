From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Feb 2020 15:27:47 +0100
Subject: [Buildroot] [PATCH 2/2] linux: use correct conditional for
 wireguard kernel config fixup
In-Reply-To: <20200215182020.20862-2-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 15 Feb 2020 19:20:20 +0100")
References: <20200215182020.20862-1-peter@korsgaard.com>
 <20200215182020.20862-2-peter@korsgaard.com>
Message-ID: <87mu9ifvz0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Commit de591c5c3a93 (package/wireguard-linux-compat: new package) split up
 > the wireguard package in wireguard-tools and wireguard-linux-compat, but
 > forgot to update the conditional in linux.mk, so the kernel config fixups
 > needed for wireguard are no longer applied.

 > Update the conditional to use the BR2_PACKAGE_WIREGUARD_LINUX_COMPAT symbol
 > instead.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
