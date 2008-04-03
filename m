From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 3 Apr 2008 17:34:55 +0200
Subject: [Buildroot] ARCH=ppc vs powerpc
References: <0d2f01c894cc$1fb56540$f52f9e86@LPSC0173W><8763v071sq.fsf@macbook.be.48ers.dk>
	<20080402164154.GE9436@mx.loc><0ddc01c89583$84ecb960$f52f9e86@LPSC0173W><87ej9n2kj4.fsf@macbook.be.48ers.dk><0e8d01c89595$e3482140$f52f9e86@LPSC0173W>
	<87bq4r0ybx.fsf@macbook.be.48ers.dk>
Message-ID: <0e9b01c895a0$47d11590$f52f9e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Suit yourself, but buildroot with Xilinx/ARCH=ppc kernels works (I use
> it myself).

Yes, but how ? What's the proper set of steps ? The idiot's guide to ml405 
system building if you wish !

Indeed Buildroot looks like a great idea and a lovely system, that's why I 
spent so much time learning how to use it, but with nothing to show at the 
end. 2 days ago I could compile everything cleanly, although it wouldn't 
boot for some reason. Today after a distclean and using the same .config 
files, it just won't go past the first few files ('no cross compiler' ?!?)

Funny thing is that I have a colleague who told me to use it because he's 
using it successfully on the same architecture, although his version is 
about a year old. I asked him to show me... He can't figure out how he ever 
got it to build in the first place.

OK, sorry for my rant. Just need to vent off some frustration.
-- 
Guillaume Dargaud
http://www.gdargaud.net/
