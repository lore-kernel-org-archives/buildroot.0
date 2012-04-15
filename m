From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Apr 2012 23:09:57 +0200
Subject: [Buildroot] [PATCH] package: set PKG_CONFIG_SYSROOT_DIR in
	HOST_MAKE_ENV
In-Reply-To: <1333543819-27718-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Wed, 4 Apr 2012 14:50:19 +0200")
References: <1333543819-27718-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87hawkaehm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> A host package that uses AUTORECONF (such as host-libglib2)
 Sven> may end up running './config.status --recheck'. This will
 Sven> call the configure script with the environment variables
 Sven> set in HOST_MAKE_ENV. If PKG_CONFIG_SYSROOT_DIR is missing
 Sven> this will cause the hardcoded sysroot dir take effect leading
 Sven> to wrong paths.

Committed, thanks.

-- 
Bye, Peter Korsgaard
