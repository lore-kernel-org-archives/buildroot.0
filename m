From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Feb 2010 16:51:32 +0100
Subject: [Buildroot] [PATCH 01/16] automake: add build dependency on
	host-autoconf
In-Reply-To: <f03faaf3ab5bbd5f375c47c3cf12f1254d1237bd.1266691382.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 20 Feb 2010 19:42:52 +0100")
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<cover.1266691382.git.thomas.petazzoni@free-electrons.com>
	<f03faaf3ab5bbd5f375c47c3cf12f1254d1237bd.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fx4tjmkb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> automake for the target fails to build if autoconf is not installed on
 Thomas> the host:

 Thomas> checking whether autoconf is installed... no
 Thomas> configure: error: Autoconf 2.58 or better is required.
 Thomas>     Please make sure it is installed and in your PATH.
 Thomas> make: *** [/home/test/brbuilttest/build/automake-1.10/.stamp_configured] Error 1

It doesn't look like it really needs it for anything at build time, but
ok - It doesn't hurt building autoconf.

-- 
Bye, Peter Korsgaard
