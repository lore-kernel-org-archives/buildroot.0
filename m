From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Sep 2012 16:27:37 +0200
Subject: [Buildroot] [PATCH] Replace DL_DIR refs in the GIT/SVN/HG
	download
In-Reply-To: <CANxTyt4a9qs1uspp6RUQq5Mm8sALLStdOfJdTsbky_PsCQWdNA@mail.gmail.com>
 (Danomi Manchego's message of "Mon, 27 Aug 2012 21:13:03 -0400")
References: <1346026375-15339-1-git-send-email-danomimanchego123@gmail.com>
 <CAHXCMMKs4GxWiKbi8dnjezAK5z9s0srDh6u6TFD+BVOG5bWSLA@mail.gmail.com>
 <CANxTyt4a9qs1uspp6RUQq5Mm8sALLStdOfJdTsbky_PsCQWdNA@mail.gmail.com>
Message-ID: <87y5kiymue.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

Hi,

 Danomi> Basically, Arnout's reminder that the default DL_DIR value
 Danomi> is?"$(TOPDIR)/dl" was enough to convince me to recommend adding
 Danomi> $(TOPDIR) to all our defconfigs - fixing my particular
 Danomi> situation. ?So I'm not 100% invested in this patch, if people
 Danomi> would rather?leave the download helpers as-is ...

I've just pushed a change to use mkdir -p $(DL_DIR) && cd $(DL_DIR) &&
pwd similiar to how we do for the output directory for out of tree
builds.

-- 
Bye, Peter Korsgaard
