From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 May 2015 21:02:38 +0200
Subject: [Buildroot] [PATCH] package/enlightenment: disable ptrace with
	xtensa and uClibc-ng
In-Reply-To: <1431880846-28839-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 17 May 2015 18:40:46 +0200")
References: <1431880846-28839-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87siav6n8x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > uCLibc-ng needs to backport the uClibc commit
 > de6561f6669308e5d2297589b39a217d4c14df1c to add
 > PT_GETSIGINFO definition.

 > This commit is already merged in uClibc-snapshot used by
 > Buildroot's toolchains for xtensa.

 > For now, disable ptrace with xtensa uClibc-ng toolchains.

 > Thanks to Gergely Imreh for the initial investigation and
 > patch:
 > http://patchwork.ozlabs.org/patch/470073/

 > Fixes:
 > http://autobuild.buildroot.net/results/77b/77b82e5b437d0778b3f6a3813f2c0a5c39b52db9

 > Reported-by: Gergely Imreh <imrehg@gmail.com>
 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
