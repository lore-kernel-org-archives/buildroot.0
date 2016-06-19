From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 22:33:49 +0200
Subject: [Buildroot] [PATCH 000/121] packages: bulk-add missing hashes
	(branch yem/more-hashes-novcs)
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sun, 19 Jun 2016 13:10:43 +0200")
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <87twgo3olu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Hello All!
 > This series bulk-adds hashes to package that miss them.

 > The missing hashes were all computed locally without looking at whether
 > upstream provides hashes or not.

 > The corresponding archives were also downloaded from s.b.o. and the
 > hashes compared. When there was a mismatch, the commit log contains a
 > hint for Peter to remove them from s.b.o. Jsut grep for "Peter" in the
 > commit logs. ;-)

Thanks! Committed all except for linux-headers.

-- 
Bye, Peter Korsgaard
