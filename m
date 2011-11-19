From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 19 Nov 2011 09:24:06 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <201111182316.42534.arnout@mind.be> (Arnout Vandecappelle's
 message of "Fri, 18 Nov 2011 23:16:42 +0000")
References: <20111102160349.4afe5935@skate> <201111181751.22578.arnout@mind.be>
 <87fwhlrqjm.fsf@macbook.be.48ers.dk>
 <201111182316.42534.arnout@mind.be>
Message-ID: <87bos8seop.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> Rather than handling both staging and target, I would prefer to move to
 >> generating target from staging just before the filesystems are created
 >> (similar to the other target-finalize stuff).

 Arnout>  Well...

 Arnout>  'make clean-target' is currently easy to implement.
 Arnout> Generating target from staging is not.  So I hope you don't
 Arnout> mean that this preference would block the acceptance of 'make
 Arnout> clean-target'.

No, that's not what I'm saying - Just that I rather merge staging/target
before doing any significant work on a clean-staging.

-- 
Bye, Peter Korsgaard
