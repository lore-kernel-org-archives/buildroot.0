From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Aug 2013 09:29:32 +0200
Subject: [Buildroot] debugging inittab
In-Reply-To: <521ED985.9050705@mind.be> (Arnout Vandecappelle's message of
 "Thu, 29 Aug 2013 07:17:57 +0200")
References: <2DD0B9C711CDFC45A3A266C78966CE7F451F39A0@G4W3291.americas.hpqcorp.net>
 <5216A076.5030409@mind.be>
 <2DD0B9C711CDFC45A3A266C78966CE7F451F8F81@G4W3291.americas.hpqcorp.net>
 <521ED985.9050705@mind.be>
Message-ID: <878uzlgdk3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> That was the problem. Thanks!

 Arnout>  Right. Maybe we should just rename target/ to
 Arnout> THIS_IS_NOT_YOUR_ROOT_FILESYSTEM instead of just creating the
 Arnout> file. The latter is obviously not enough.

 Arnout>  What was the reason we didn't do that in the first place?

People didn't seem to like it when I suggested it.

It would mean a change of behaviour, so perhaps we need to add a target
symlink like we did for staging?

-- 
Bye, Peter Korsgaard
