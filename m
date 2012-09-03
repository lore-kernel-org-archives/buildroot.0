From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Sep 2012 21:39:51 +0200
Subject: [Buildroot] Buildroot 2012.08 released
In-Reply-To: <504224FA.1070908@mind.be> (Arnout Vandecappelle's message of
 "Sat, 01 Sep 2012 17:08:42 +0200")
References: <20120831112123.672bd606@skate> <504224FA.1070908@mind.be>
Message-ID: <87y5kqopyw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 08/31/12 11:21, Thomas Petazzoni wrote:
 >> - Cleanups to the package infrastructure. The visible change
 >> to developers is that $(eval $(call AUTOTARGETS)) is now
 >> $(eval $(autotools-package)), and similarly for other package
 >> infrastructures and host packages. Refer to the documentation for
 >> details.

 Arnout>  It's unfortunate that my patch for detecting legacy XXXTARGETS
 Arnout> usage wasn't merged.  I'm afraid there will be many people
 Arnout> hitting that problem...

 Arnout>  (I realize it's my own responsibility for not pushing it a
 Arnout> second time when the deadline was approaching...)

Indeed. Lets wait a few days and see if something else critical shows
up, then perhaps we can do a 2012.08.1 bugfix release.

-- 
Bye, Peter Korsgaard
