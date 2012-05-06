From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 May 2012 13:40:57 +0200
Subject: [Buildroot] [PATCH resend] directfb: add support for davinci
	gfx driver
In-Reply-To: <4FA6601A.60203@mind.be> (Arnout Vandecappelle's message of "Sun, 
 06 May 2012 13:27:22 +0200")
References: <1335631844-15681-1-git-send-email-arnout@mind.be>
 <87obq3f16o.fsf@macbook.be.48ers.dk> <4FA6601A.60203@mind.be>
Message-ID: <87mx5la65y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> For some odd reason, I don't see the davincifb.h file in the directfb
 >> tarball, but it IS in git:
 >> 
 >> http://git.directfb.org/?p=core/DirectFB.git;a=tree;f=gfxdrivers/davinci;h=f0bd9ad6add6164f3a5e953d4eed4056315a2be2;hb=ab0d779e85cec22c7c2e7b8b6b1976049b1ba0f1
 >> 
 >> Is it working for you? If so, how?

 Arnout>  davincifb.h is the kernel header file which contains the
 Arnout> davinci-specific interfaces.  Unfortunately the davinci stuff
 Arnout> doesn't get upstreamed, so you need a davinci-specific fork
 Arnout> like git://arago-project.org/git/projects/linux-davinci.git

 Arnout>  I thought I tested it with davinci-specific kernel headers,
 Arnout> but I can't find the output anymore and I can't reproduce it...

 Arnout>  One solution would be to add includethe davincifb.h file with
 Arnout> a buildroot patch. However, I don't have a davinci board
 Arnout> anymore so I can't even test if it works.

 Arnout>  Therefore, I prefer to revert the patch.

Ok, if nobody else thinks otherwise then I'll revert.

-- 
Bye, Peter Korsgaard
