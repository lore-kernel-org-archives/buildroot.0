From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Oct 2014 01:56:31 +0200
Subject: [Buildroot] [PATCH 1/1] Change /bin/bash shebangs into
	/usr/bin/env bash
In-Reply-To: <1413900356-5423-1-git-send-email-bjorn.forsman@gmail.com>
 (=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Tue, 21 Oct 2014 16:05:56
 +0200")
References: <1413900356-5423-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <87egtx6mz4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 > Not all systems have /bin/bash (e.g. NixOS[1] doesn't). Buildroot
 > already uses /usr/bin/env shebangs for other interpreters (perl,
 > python), so why not bash?

 > This changes only the shebangs used by Buildroot itself; stuff installed
 > to the target system is left unchanged.

 > With this applied I can run Buildroot unmodified on NixOS.

 > [1]: http://nixos.org/

 > Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
