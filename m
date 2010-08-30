From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Aug 2010 23:36:05 +0200
Subject: [Buildroot] Make 3.82 does behave differently than make
	3.81	for sure, but ...
In-Reply-To: <4C7C1E28.1060806@jdines.net> (James J. Dines's message of "Mon, 
	30 Aug 2010 17:10:00 -0400")
References: <4C7B99D5.9010703@jdines.net> <87bp8kxlve.fsf@macbook.be.48ers.dk>
	<4C7BC441.3010006@jdines.net>
	<201008301701.22856.yann.morin.1998@anciens.enib.fr>
	<4C7BD1D6.5070100@jdines.net>
	<20100830163153.GA12776@merkur.ravnborg.org>
	<8739tvyip6.fsf@macbook.be.48ers.dk> <4C7C12E3.30005@jdines.net>
	<87y6bnx1h8.fsf@macbook.be.48ers.dk> <4C7C1E28.1060806@jdines.net>
Message-ID: <87pqwzwzp6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James J Dines <jdines@jdines.net> writes:

Hi,

 James> I went for a third option (applying Yann's patch) and it indeed
 James> allows the 'make clean' to work.  I remain confused why we did
 James> not need this patch to do a complete build with make 3.81
 James> however.  I just tried it again, and I do not get the error
 James> message on my other machine with 3.81 even without the patch.

No, it seems like make 3.81 ignores those invalid lines.

besides this issue, is everything working for you with ake 3.82?

-- 
Bye, Peter Korsgaard
