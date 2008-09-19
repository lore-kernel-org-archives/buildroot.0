From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Sep 2008 16:48:10 +0200
Subject: [Buildroot] broken build rootfs workflow
In-Reply-To: <6a2e33620809180253t4b32032eu399ab6734076f367@mail.gmail.com>
	(Fathi Boudra's message of "Thu\, 18 Sep 2008 11\:53\:07 +0200")
References: <6a2e33620809180148i7f4c3829jb7857a8adf90bcfa@mail.gmail.com>
	<6a2e33620809180253t4b32032eu399ab6734076f367@mail.gmail.com>
Message-ID: <87iqssyyxh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fathi" == Fathi Boudra <fboudra@gmail.com> writes:

Hi,

 Fathi> My configuration file is copied properly, then a bunch of sed
 Fathi> commands modify it inside .oldconfig ???  I guess if I provide
 Fathi> my own configuration file, I don't want my file modified by
 Fathi> random sed commands ?

Well, it has to do that as quite some packages needs to know if those
features are enabled or not - Please just configure buildroot (under
toolchain) to match what you want.

-- 
Bye, Peter Korsgaard
