From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Nov 2010 23:25:26 +0100
Subject: [Buildroot] [PATCH] module-init-tools: fix cofigure bug by
	bumping to 3.12
In-Reply-To: <20101111141642.25734.77865.stgit@localhost6.localdomain6>
	(Paulius Zaleckas's message of "Thu, 11 Nov 2010 16:16:43 +0200")
References: <20101111141642.25734.77865.stgit@localhost6.localdomain6>
Message-ID: <874obfa8q1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paulius" == Paulius Zaleckas <paulius.zaleckas@gmail.com> writes:

 Paulius> 3.11 fails to configure/compile for my host (F14) due to bug
 Paulius> in ax_enable_builddir.m4

Committed, thanks.

-- 
Bye, Peter Korsgaard
