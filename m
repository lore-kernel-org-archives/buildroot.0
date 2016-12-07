From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Dec 2016 20:04:03 +0100
Subject: [Buildroot] [PATCH] pkg-autotools: search in the source
	directory for ltmain.sh
In-Reply-To: <20161207184120.GA12225@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Wed, 7 Dec 2016 19:41:20 +0100")
References: <20161207184120.GA12225@waldemar-brodkorb.de>
Message-ID: <87r35jh87w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Fixes static linking of berkeleydb package, where ltmain.sh
 > is not in the sub-directory that contains configure.
 > Always search the complete source directory.

 > Fixes:
 >  http://autobuild.buildroot.net/results/f0a96f671644d9f9efcf245b354affdc84f7d7da

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > Solution found after discussion and suggestions with Arnout and
 > Thomas P.
 > thx

Committed, thanks.

-- 
Bye, Peter Korsgaard
