From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:08:01 +0200
Subject: [Buildroot] [PATCHv2 08/14] gcc/gcc-final: use the common
	HOST_GCC_CONFIGURE_SYMLINK macro
In-Reply-To: <1378138000-12739-9-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:34 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-9-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqmhiyj2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Each stage of the gcc build needs to make a small dance before the
 Thomas> configuration step to create a build sub-directory and a symbolic link
 Thomas> to the configure script. The common gcc.mk had a
 Thomas> HOST_GCC_CONFIGURE_SYMLINK already used by the gcc-initial and
 Thomas> gcc-intermediate steps, but the gcc-final step wasn't using it.

 Thomas> This commit fixes this inconsistency, and therefore removes the
 Thomas> HOST_GCC_FINAL_CONFIGURE_SYMLINK macro.

Committed, thanks.

-- 
Bye, Peter Korsgaard
