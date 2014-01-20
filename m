From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Jan 2014 22:43:06 +0100
Subject: [Buildroot] [PATCH v4 1/1] ljsyscall: new package
In-Reply-To: <1389928225-1845-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Thu, 16 Jan 2014 22:10:25 -0500")
References: <1389928225-1845-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <871u02jpn9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 > An FFI implementation of the Linux and NetBSD kernel ABIs for LuaJIT.
 > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

 > ---

 > Note: this package requires LuaJIT specifically, so there is a depends-on
 > in the ljsyscall/Config.in, even though though it is included from a
 > menu with a "if BR2_PACKAGE_LUA || BR2_PACKAGE_LUAJIT" test around it.

 > v3 -> v4:
 >  - Rebase to master
 >  - Bump version to 0.9
 >  - Use github helper for download
 >  - Account for shared directory

Committed, thanks.

-- 
Bye, Peter Korsgaard
