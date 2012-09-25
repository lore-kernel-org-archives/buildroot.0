From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Sep 2012 22:36:55 +0200
Subject: [Buildroot] [PATCH 1/1] allow to pass the number of parallel
	jobs via command line
In-Reply-To: <1348568223-13874-1-git-send-email-plagnioj@jcrosoft.com>
 (Jean-Christophe PLAGNIOL-VILLARD's message of "Tue, 25 Sep 2012
 12:17:03 +0200")
References: <1348568223-13874-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <87txul7sbc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 Jean-Christophe> use PARALLEL_JOBS=x for this
 Jean-Christophe> This will overwrite the value in BR2_JLEVEL

why not just use make BR2_JLEVEL=x ?

-- 
Bye, Peter Korsgaard
