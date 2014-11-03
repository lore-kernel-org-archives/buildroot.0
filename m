From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2014 22:04:13 +0100
Subject: [Buildroot] [git commit] avahi: fix avahi-ui build with libgtk3
In-Reply-To: <5457EB94.8090005@mind.be> (Arnout Vandecappelle's message of
 "Mon, 03 Nov 2014 21:54:44 +0100")
References: <20141031115353.56D52B23C4@busybox.osuosl.org>
 <1414799165.15213.1.camel@posteo.de> <20141101191304.GG10189@free.fr>
 <1415008511.2065.2.camel@posteo.de> <5457EB94.8090005@mind.be>
Message-ID: <87k33c2dyq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 > On 03/11/14 10:55, J?rg Krause wrote:

 >> I'd like to discuss some possibilities to solve this issue:
 >> 
 >> 1) forget about patching Makefile.am / running
 >> autoreconf and just strip the CFLAGS arguments in Makefile.in as Peter
 >> suggested

 >  I think this one is the most practical. Patching the .am is generally better
 > because then it's upstreamable, but that's not relevant here.

Yeah, definately for 2014.11. I'll go and rework the patch now.

-- 
Bye, Peter Korsgaard
