From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Oct 2011 09:15:09 +0200
Subject: [Buildroot] Some topics for the Buildroot Developer Day
In-Reply-To: <20111025063444.GI9199@pengutronix.de> (Robert Schwebel's message
 of "Tue, 25 Oct 2011 08:34:44 +0200")
References: <20111024173815.2277c6dd@skate>
 <20111024165904.GB9199@pengutronix.de> <20111024214747.279c6e72@skate>
 <4EA5C53B.5000406@eukrea.com> <87vcrdy5g4.fsf@macbook.be.48ers.dk>
 <20111025063444.GI9199@pengutronix.de>
Message-ID: <87wrbtwnia.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Schwebel <r.schwebel@pengutronix.de> writes:

Hi,

 >> What I'm currently doing is simply lots of 'make randpackageconfig'
 >> builds - But it generates lots of data, so I haven't found a good way
 >> of putting this information online.

 Robert> When we started with tests, we quickly found out that you don't only
 Robert> have to be able to test, but also have to cope with what you'll find :)
 Robert> So if you find lots of broken things, you have to fix them, and that
 Robert> quickly becomes a lot of work.

Indeed. That's the same experience I have from all then
'randpackageconfig' builds. Making the issues public (and fixing what
you can) is not a bad thing though.

-- 
Bye, Peter Korsgaard
