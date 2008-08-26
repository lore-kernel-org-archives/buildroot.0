From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 16:54:39 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
In-Reply-To: <20080826140744.GO2213@mx.loc> (Bernhard Reutner-Fischer's
	message of "Tue\, 26 Aug 2008 16\:07\:44 +0200")
References: <20080826121930.77B8B3C79C@busybox.net>
	<87k5e3gbne.fsf@macbook.be.48ers.dk> <19162136.post@talk.nabble.com>
	<20080826140744.GO2213@mx.loc>
Message-ID: <87fxorbzdc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 Bernhard> Exactly. selecting cruft behind the scenes is almost always the wrong
 Bernhard> thing to do.
 Bernhard> We did not do this until recently, when e.g. Ulf started to add
 Bernhard> gazillions of (imho unwarranted) select's.

Well, selects are imho good for real dependencies instead of those
comments we used to have (foo depends on bar) - But it shoudl ofcause
only be used for required dependencies.

-- 
Bye, Peter Korsgaard
