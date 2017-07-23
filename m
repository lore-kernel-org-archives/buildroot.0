From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jul 2017 15:01:21 +0200
Subject: [Buildroot] [PATCH 02/20] core/pkg-generic: add variable to
	skip skeleton dependency
In-Reply-To: <20170723092144.GD2917@scaer> (Yann E. MORIN's message of "Sun,
 23 Jul 2017 11:21:44 +0200")
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <85a6c3a598a517fd0fad2cba0b7c42d746c7830e.1500398733.git.yann.morin.1998@free.fr>
 <e507f13d-b54b-9205-d3e6-853b072744d5@mind.be>
 <871sp7pldt.fsf@dell.be.48ers.dk> <20170723092144.GD2917@scaer>
Message-ID: <87shhnnw7y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> An alternative could be to enforce a naming convention for these
 >> packages, E.G. skeleton-*, and then use $(filter skeleton%,$(1)) in the
 >> check, but I'm not sure that really is much nicer.

 > We also talked about that possibility on IRC, and came to the conclusion
 > that it was not nice to hard-code magic values in the infra.

Ok, We aldready did have skeleton hardcoded - But ok, the variable
solution is also fine by me.

-- 
Bye, Peter Korsgaard
