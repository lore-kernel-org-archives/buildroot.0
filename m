From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Dec 2010 17:19:22 +0100
Subject: [Buildroot] [PATCH] strip path when untaring kernel for headers
In-Reply-To: <20101205213021.10524.40028.stgit@localhost.localdomain> (Paulius
	Zaleckas's message of "Sun, 05 Dec 2010 23:30:21 +0200")
References: <20101205213021.10524.40028.stgit@localhost.localdomain>
Message-ID: <87vd2xir1x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> This is needed when custom/snapshot kernel headers are selected.
 Paulius> Buildroot expects to find dl/linux-2.6.tar.bz2 and also expects
 Paulius> it to extract to output/toolchain/linux-2.6, but if you tar
 Paulius> custom kernel sources directory can be anything, etc. linux-git.
 Paulius> In that case buildroot would extract it to output/toolchain/linux-git.
 Paulius> So fix this behaviour, by using tar strip-directory/component.

 Paulius> Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
