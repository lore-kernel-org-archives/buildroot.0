From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 14:54:48 +0200
Subject: [Buildroot] [PATCH] libserialport: Fix detection of OS when
	compiling for ucLinux
In-Reply-To: <1472462750-18919-1-git-send-email-paul.cercueil@analog.com>
 (Paul Cercueil's message of "Mon, 29 Aug 2016 11:25:50 +0200")
References: <1472462750-18919-1-git-send-email-paul.cercueil@analog.com>
Message-ID: <871t177n1j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul.cercueil@analog.com> writes:

 > When compiling with a toolchain targetted at ucLinux, libserialport's
 > configure.ac would fail at detecting the target operating system.
 > As a result, the Linux-specific files were not compiled in that
 > particular case.

 > While this commit does not fix any autobuider failure for this package,
 > it fixes autobuilder failures for other packages, for instance:

 > http://autobuild.buildroot.net/results/69e/69e43bc171e554cf10f2ad526cebf5e0e524538a/

Committed, thanks. Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
