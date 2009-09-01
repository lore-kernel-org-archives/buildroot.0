From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Sep 2009 17:16:29 +0200
Subject: [Buildroot] [PATCH] libarchive package added
In-Reply-To: <20090901150717.GC17682@buzzloop.caiaq.de> (Daniel Mack's message
	of "Tue\, 1 Sep 2009 17\:07\:17 +0200")
References: <1251209096-31922-1-git-send-email-daniel@caiaq.de>
	<87skf6pvi6.fsf@macbook.be.48ers.dk>
	<20090901150717.GC17682@buzzloop.caiaq.de>
Message-ID: <87ocpupueq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 >> When would you not want to do this?

 Daniel> We need that library for a binary which is linked
 Daniel> statically. Installing it is not necessary in our case.

 Daniel> But as the default is 'y', this should not be a disadvantage
 Daniel> for anyone.  We could, of course, also delete it manually at a
 Daniel> later point.

Ok, we don't normally do this per-package - So I'm hessitant to add it
here. Other than that, it looks fine.

-- 
Bye, Peter Korsgaard
