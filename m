From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Mar 2011 22:47:40 +0100
Subject: [Buildroot] [PATCHv2] fetch/git: clone the repository as bare
In-Reply-To: <1300291628-7478-1-git-send-email-plagnioj@jcrosoft.com>
	(Jean-Christophe PLAGNIOL-VILLARD's message of "Wed, 16 Mar 2011
	17:07:08 +0100")
References: <1300193398-15217-1-git-send-email-plagnioj@jcrosoft.com>
	<1300291628-7478-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <8762rin3er.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 Jean-Christophe> this will reduce the space used and speed up the clone
 Jean-Christophe> as we will generate an archive later which does need
 the tree checkouted

Committed with slightly tweaked commit message, thanks.

-- 
Bye, Peter Korsgaard
