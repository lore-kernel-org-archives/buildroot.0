From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Dec 2010 11:48:49 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain: fix again stamp file touch
In-Reply-To: <1b94958acacfda721682103452ced93d539f9a9c.1293100963.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Thu, 23 Dec 2010 11:42:49 +0100")
References: <cover.1293100963.git.thomas.petazzoni@free-electrons.com>
	<cover.1293100963.git.thomas.petazzoni@free-electrons.com>
	<1b94958acacfda721682103452ced93d539f9a9c.1293100963.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ei98sr1q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> In e6633fd2e37d25f32958f30e852baa216ce1384a I did crap, and added a
 Thomas> quietization inside a shell command, which was already quietized. This
 Thomas> was stupid, and is fixed by this patch.

Committed, thanks.

-- 
Bye, Peter Korsgaard
