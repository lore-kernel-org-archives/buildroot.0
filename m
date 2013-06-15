From: piquemal michel <michel_piquemal@yahoo.fr>
Date: Sat, 15 Jun 2013 21:58:26 +0100 (BST)
Subject: [Buildroot] Building with uClibc 0.9.28, Linux 2.6.36
In-Reply-To: <87bo77yveg.fsf@dell.be.48ers.dk>
References: <1371326730.31593.YahooMailNeo@web171503.mail.ir2.yahoo.com>
 <87bo77yveg.fsf@dell.be.48ers.dk>
Message-ID: <1371329906.70128.YahooMailNeo@web171503.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Peter for your quick answer.
Actually that version supports only 0.9.30 and 0.9.31.

Even Buildroot 2009-02 can't go below 0.9.29 and I can't find any between 2005 and 2009...
I also expect Linux 2.6.36 was released much later than uClibC 0.9.28, so unsure an out-of-the-box buildroot setup will exist.
Hopefully there might still be some solution...

Best,



----- Mail original -----
De?: Peter Korsgaard <jacmet@uclibc.org>
??: piquemal michel <michel_piquemal@yahoo.fr>
Cc?: "buildroot at busybox.net" <buildroot@busybox.net>
Envoy? le : Samedi 15 juin 2013 22h24
Objet?: Re: Building with uClibc 0.9.28, Linux 2.6.36

>>>>> "piquemal" == piquemal michel <michel_piquemal@yahoo.fr> writes:

piquemal> Hi,

piquemal> I'm trying to build a matching dev environment for a MIPSel
piquemal> embedded product that I bought.? It's based uClibc 0.9.28,
piquemal> Linux 2.6.36, I know...pretty old stuff.

Argh, indeed.

piquemal> I started off latest 05-13 buildroot menuconfig, setting up
piquemal> target HW, linux version.? While I could not select
piquemal> appropriate uClibC version I left default, but made some
piquemal> minor change in uclib.mk to reflect proper version and
piquemal> download location.

I wouldn't try to combine such an only uClibc version with anything
recent, as recent programs often need features not available in older
uClibc versions.

Looking back in the git history, we removed uClibc 0.9.28 support in the
2010.08 cycle, so I think the 2010.05 release is your best bet.

-- 
Bye, Peter Korsgaard
