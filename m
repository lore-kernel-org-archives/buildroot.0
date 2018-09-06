From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Sep 2018 09:05:36 +0200
Subject: [Buildroot] [PATCH] synergy: change upstream location to fix
 download issues
In-Reply-To: <851ab7ef-3a2c-c5b3-7e4e-5f424aac6413@mind.be> (Arnout
 Vandecappelle's message of "Tue, 4 Sep 2018 10:52:59 +0200")
References: <20180902204505.30928-1-thomas.petazzoni@bootlin.com>
 <871sab3v4l.fsf@dell.be.48ers.dk> <20180903102655.6f7f8df4@windsurf>
 <1262e995-3152-4014-dad5-770f2e83a4ac@mind.be>
 <20180904100350.15acb6fc@windsurf>
 <851ab7ef-3a2c-c5b3-7e4e-5f424aac6413@mind.be>
Message-ID: <875zzjaywv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> True. But if people fix to use the new upstream, then the hash becomes
 >> different. But perhaps that's OK.
 >> 
 >> So all in all, you're saying that we should keep it as-is in
 >> master/2018.02.x/2018.05.x, and simply change in next ?

 >  Yes, that's what I'm saying. Don't fix what's not broken. We have plenty of
 > other patches to apply :-)

I agreed, lets just fix this up when bumping and leave 2018.02.x /
2018.05.x / 2018.08.x as is.

-- 
Bye, Peter Korsgaard
