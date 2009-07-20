From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Jul 2009 22:35:42 +0200
Subject: [Buildroot] [PATCH 2/2] mtd-utils.git: fix targets
In-Reply-To: <20090720112525.GV13236@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon\, 20 Jul 2009 13\:25\:25 +0200")
References: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
	<1244029145-11832-2-git-send-email-daniel@caiaq.de>
	<878wikg3sp.fsf@macbook.be.48ers.dk>
	<20090720112525.GV13236@buzzloop.caiaq.de>
Message-ID: <87ljmjdrdt.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 >> What about the patches? They no longer apply:
 >> 
 >> Applying mtd-utils-all-targets.patch using plaintext: 
 >> patching file Makefile
 >> Hunk #1 FAILED at 72.
 >> 1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej
 >> Patch failed!  Please fix mtd-utils-all-targets.patch!

 Daniel> Erm, yes. Sorry. I removed them locally but forgot to add that to the
 Daniel> patch. They're not needed anymore. Could you do that when commiting?

Sure - Both patches?

-- 
Bye, Peter Korsgaard
