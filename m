From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 May 2013 21:41:40 +0200
Subject: [Buildroot] [PATCH 1/2] Refactoring Freescale's iMX software
	revision levels
In-Reply-To: <5183F029.1000907@mind.be> (Arnout Vandecappelle's message of
 "Fri, 03 May 2013 19:13:13 +0200")
References: <1367569664-3307-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <42565.217.149.209.147.1367582464.squirrel@webmail.internl.net>
 <5183F029.1000907@mind.be>
Message-ID: <87r4hlnrij.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  Ah, yes stupid of me. Normally the order of assignments doesn't
 Arnout> matter, but the generic-target contains an 'ifndef $(2)_VERSION'.

 Arnout>  So the only solution is to collect the imx packages in an imx
 Arnout> subdirectory, like qt5. I've told Henk earlier that we try to
 Arnout> avoid creating subdirectories in the package directory, but
 Arnout> perhaps this is a good reason to do it. What do the others
 Arnout> think?

Yes, I guess this is the best option.

-- 
Bye, Peter Korsgaard
