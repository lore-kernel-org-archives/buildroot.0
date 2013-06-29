From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 29 Jun 2013 10:22:53 +0200
Subject: [Buildroot] [PATCHv3 ] python3: Port python2 patches to reduce
	the interpreter size
In-Reply-To: <1369816617-6315-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 29 May 2013 10:36:57 +0200")
References: <1369816617-6315-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87obapxr4y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Some of the python2 patches were left behind when doing the python3
 Maxime> package. This was because the python build system can now autodetect
 Maxime> what packages can be built in the system.

 Maxime> However, some of these patches are actually useful to reduce
 Maxime> drastically the size of the interpreter.

 Maxime> This patch ports the relevant patches to the python3 package,
 Maxime> and adds a new patch to remove the idle3 IDE as well from the
 Maxime> interpreter.

 Maxime> Fixes #5696

Committed, thanks.

-- 
Bye, Peter Korsgaard
