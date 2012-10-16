From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Oct 2012 23:00:30 +0200
Subject: [Buildroot] [git commit] package: add gnupg
In-Reply-To: <507DB21F.1090506@mind.be> (Arnout Vandecappelle's message of
 "Tue, 16 Oct 2012 21:14:39 +0200")
References: <20121015082204.6813A99871@busybox.osuosl.org>
 <20121016185610.36a03eff@skate> <87ipaatf0w.fsf@macbook.be.48ers.dk>
 <507DB21F.1090506@mind.be>
Message-ID: <87a9vmt9n5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout>  I think this is the reason why gnupg wasn't included before.
 Arnout> My colleague Stijn submitted a patch series for a more recent
 Arnout> version of gnupg a while ago, and that also faced a portability
 Arnout> problem (in the 'portable threads library :-) Thomas suggested
 Arnout> to wait for npth-based gnupg 2.1, but that one hasn't been
 Arnout> released yet.

I believe the threads issue was only with gnupg 2.x. This issue was
simply configure doing the wrong thing when cross compiling (which I
have now fixed).

-- 
Bye, Peter Korsgaard
