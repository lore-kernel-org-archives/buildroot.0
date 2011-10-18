From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Oct 2011 14:41:10 +0200
Subject: [Buildroot] Request for comments on packages for TI's OMAP3 and
	DM365 processors
In-Reply-To: <201110181433.26332.arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 18 Oct 2011 14:33:26 +0200")
References: <1284746402-19186-1-git-send-email-pierreluc.simard@admetric.ca>
 <201110181123.03836.arnout@mind.be>
 <201110181433.26332.arnout@mind.be>
Message-ID: <87wrc2321l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  Looks like I spoke too soon...

 Arnout>  That TI stuff is an unholy mess of different libraries,
 Arnout>  usually binary-only.  The patches that Pierre-Luc posted don't
 Arnout>  work anymore because things have been moved around on the TI
 Arnout>  website.  But the worst thing of all, all packages use a
 Arnout>  binary installer that has to be executed to self-extract the
 Arnout>  source code and (binary) libraries.

Sigh :/

 Arnout>  Fortunately, TI's license allows redistribution in any form.
 Arnout>  So we are allowed to repackage the extracted source/binary
 Arnout>  code.  That would be my preferred approach: download a .tgz
 Arnout>  from the buildroot mirror instead of going through the mess of
 Arnout>  running installer binaries.

 Arnout>  Peter, is that an acceptable solution?

Hmm, I would prefer not to, but if there's no other option..

 Arnout>  Bottom line will be that nothing of Pierre-Luc's original
 Arnout>  patches will be left.  For sure, I will limit my work to DM365
 Arnout>  (that's the one I need myself).  And finally, my project
 Arnout>  manager just bumped down the priority of having the
 Arnout>  gstreamer-ti plugins in our project, so I may never do it
 Arnout>  after all...

:/

-- 
Bye, Peter Korsgaard
