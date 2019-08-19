From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 00:00:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-08-18
In-Reply-To: <20190819233256.01c0f4a1@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 19 Aug 2019 23:32:56 +0200")
References: <20190819054333.566812D8079@tinkie.tkos.co.il>
 <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
 <20190819145514.19722372@windsurf.home>
 <4a15c906-869d-d069-1e3a-b6cefff69f1f@mind.be>
 <20190819233256.01c0f4a1@windsurf.home>
Message-ID: <87zhk4erxo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 > "we only show the highest release" -> release-monitoring.org doesn't
 > have the notion of "stable branches" from upstream or anything like
 > that. It even considers -rc versions to be more recent than a regular
 > official release.

 > But I see your point that anyway release-monitoring.org is only very
 > partially helping to track whether we need to update for security
 > reasons. A CVE-related tracking tool (such as what Matt Weber was
 > working on back then) would be better suited for this task.

 > If you agree with this, then perhaps the autobuild.b.o/stats/ page, and
 > the corresponding JSON output, should be generated based on the next
 > branch rather than the master branch.

Presumably only if next exists (and then we have to remember to delete
it as soon as we merge it into master and not just let it linger until
the next release)?

 > Should I go ahead and make the change ?

It sounds sensible to me, yes.

-- 
Bye, Peter Korsgaard
