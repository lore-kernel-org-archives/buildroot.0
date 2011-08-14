From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Aug 2011 08:53:19 +0200
Subject: [Buildroot] [PATCH] Fix the Python build when running Linux 3.*
In-Reply-To: <1313151776-26401-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Fri, 12 Aug 2011 14:22:56 +0200")
References: <1313151776-26401-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87pqk8h4bk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> When compiling Python on a host running Linux 3.0, the sys.platform
 Maxime> constant is set at "linux3". A lot of code (inside the interpreter
 Maxime> itself, its build system and third party apps and libraries) relies on
 Maxime> it to be linux2 on a Linux system.

 Maxime> This leads to the build of the target python package to break.

 Maxime> This behaviour has been reported on the Python bugtracker but is not
 Maxime> fixed yet.

 Maxime> http://bugs.python.org/issue12326

Committed, thanks.

-- 
Bye, Peter Korsgaard
