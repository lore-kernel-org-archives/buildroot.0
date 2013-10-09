From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 14:31:46 +0200
Subject: [Buildroot] [PATCHv3 03/20] package: add a
	<pkg>_EXTRA_DOWNLOADS variable
In-Reply-To: <20131009135113.34da6eca@skate> (Thomas Petazzoni's message of
 "Wed, 9 Oct 2013 13:51:13 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87wqln4ffj.fsf@dell.be.48ers.dk> <20131008235537.102caeda@skate>
 <87siwa4wtd.fsf@dell.be.48ers.dk> <20131009135113.34da6eca@skate>
Message-ID: <87iox64oct.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> But I don't particulary find a special _EXTRA_DOWNLOADS any cleaner
 >> than just saying that only the first element in _SOURCE will be
 >> automatically extracted.

 Thomas> Well, I find it cleaner, but if you prefer to have it in
 Thomas> _SOURCE, I can certainly modify the patch to extend the
 Thomas> semantic of _SOURCE instead.  Let me know what you decide so
 Thomas> that I can respin the patch set if needed.

Just leave it for now. _EXTRA_DOWNLOADS is ok.

-- 
Bye, Peter Korsgaard
