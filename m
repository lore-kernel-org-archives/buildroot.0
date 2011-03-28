From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 Mar 2011 10:04:33 +0200
Subject: [Buildroot] [PATCH] buildroot:2011.02: Find compiler in
	environement path other than absolute path.
In-Reply-To: <1299755561-11490-1-git-send-email-sonic.adi@gmail.com> (Sonic
	Zhang's message of "Thu, 10 Mar 2011 19:12:41 +0800")
References: <1299755561-11490-1-git-send-email-sonic.adi@gmail.com>
Message-ID: <87bp0vvffy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sonic" == Sonic Zhang <sonic.adi@gmail.com> writes:

 Sonic> From: Sonic Zhang <sonic.zhang@analog.com>

 Sonic> In release 2011.02, external compiler is always prefixed by he
 Sonic> customer path.  When customer toolchain path is left empty, this
 Sonic> patch avoids prefix absolute path.

Committed, thanks.

-- 
Bye, Peter Korsgaard
