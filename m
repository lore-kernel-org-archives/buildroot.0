From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2015 22:41:43 +0200
Subject: [Buildroot] [PATCH] u-boot: 2015.07 - fix creation of .config
In-Reply-To: <55D8FE3F.8080206@mind.be> (Arnout Vandecappelle's message of
 "Sun, 23 Aug 2015 00:57:03 +0200")
References: <1438351475-14447-1-git-send-email-abrodkin@synopsys.com>
 <20150731161818.2056383e@free-electrons.com>
 <1438355649.4848.41.camel@synopsys.com>
 <1438600559.13201.4.camel@synopsys.com>
 <1439295600.3252.2.camel@synopsys.com>
 <20150812102334.15742776@free-electrons.com>
 <55D8FE3F.8080206@mind.be>
Message-ID: <87mvx8tsoo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> I haven't had the time to look into this in detail. It would be great
 >> if Yann, or J?rg could have a look. I remain unhappy with solving such
 >> a problem by using a patch against U-Boot 2015.07, because it means
 >> anyone specifying a slightly different U-Boot version (but based on
 >> 2015.07) will still have the problem.

 >  I assume the problem will be fixed soon upstream, so the chance that some chip
 > vendor releases a U-Boot based on 2015.07 is not that high. And if someone is
 > making their own modified git copy of 2015.07, they'll notice _very_ quickly
 > that it fails and with any luck they'll notice the patch in buildroot.

 >  Not fixing the problem at all in 2015.08 is obviously worse.

Agreed.

 >  We could do a sed independent of the U-Boot version, but that runs the risk of
 > breaking some other random non-2015.07 version completely.

Yeah, that sounds a bit scary.

-- 
Bye, Peter Korsgaard
