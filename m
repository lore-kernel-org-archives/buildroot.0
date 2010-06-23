From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 23 Jun 2010 12:02:24 +0200
Subject: [Buildroot] On strip and debugging symbols
In-Reply-To: <20100623115141.0bf70116@surf> (Thomas Petazzoni's message of
	"Wed, 23 Jun 2010 11:51:41 +0200")
References: <0D753D10438DA54287A00B027084269763715D5D31@AUSP01VMBX24.collaborationhost.net>
	<87hbkv6sej.fsf@macbook.be.48ers.dk>
	<0D753D10438DA54287A00B027084269763715D651B@AUSP01VMBX24.collaborationhost.net>
	<87d3vi7qqq.fsf@macbook.be.48ers.dk> <20100623091224.266d1030@surf>
	<874ogu6vsv.fsf@macbook.be.48ers.dk> <20100623104613.78fe0d97@surf>
	<87vd9a5bvy.fsf@macbook.be.48ers.dk> <20100623115141.0bf70116@surf>
Message-ID: <87r5jy5aof.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Would these wrappers then set sysroot? That could perhaps work. I
 >> wonder if the shell overhead would be significant.

 Thomas> Yes, these wrappers would set sysroot.

 Thomas> I'm not sure the cost of a shell wrapper is significant compared to the
 Thomas> cost of the compilation process itself (which already does quite a few
 Thomas> forks to run the preprocessor, the compiler, the assembler, etc.).

 Thomas> So, what would be the conclusion of this ?

Give the wrappers a try, I would say.

-- 
Bye, Peter Korsgaard
