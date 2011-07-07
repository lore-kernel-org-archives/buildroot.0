From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 Jul 2011 23:47:05 +0200
Subject: [Buildroot] [PATCH 05/28] package: add infrastructure to
	install things in images/
In-Reply-To: <33602d37e6e1d6e90cb573f5a440fe0f185df099.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:53:56 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <33602d37e6e1d6e90cb573f5a440fe0f185df099.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87liw9pxuu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This will allow the bootloader makefiles and the kernel makefile to
 Thomas> rely on the GENTARGETS infrastructure.

Committed, thanks.

-- 
Bye, Peter Korsgaard
