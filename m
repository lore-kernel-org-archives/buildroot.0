From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jun 2010 23:55:38 +0200
Subject: [Buildroot] [PATCH 26/46] grub2: only available on x86 and
	PowerPC and mark as BROKEN
In-Reply-To: <64d193b8f6b235b6ebe0b14f7ffee3f30565e7ab.1275343448.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 1 Jun 2010 00:08:12 +0200")
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<cover.1275343447.git.thomas.petazzoni@free-electrons.com>
	<64d193b8f6b235b6ebe0b14f7ffee3f30565e7ab.1275343448.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87typdgpet.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The build process of grub2 breaks the compilation. It breaks with:
 Thomas> ./configure: line 4766: syntax error near unexpected token `external'
 Thomas> ./configure: line 4766: `AM_GNU_GETTEXT(external)'

 Thomas> In addition to this, it later requires Ruby. Do we really want to make
 Thomas> Buildroot depend on Ruby being installed on the host ? Do we really
 Thomas> want to build our own Ruby ? Do we even care about Grub2 ?

I would guess not as no one has complained.

-- 
Bye, Peter Korsgaard
