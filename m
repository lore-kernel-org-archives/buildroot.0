From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 16:14:56 +0100
Subject: [Buildroot] Shell history w/ ASH spans multiple ash instances
In-Reply-To: <499D717F.9010003@bvwireless.net> (Eric Malkowski's message of
	"Thu\, 19 Feb 2009 09\:49\:35 -0500")
References: <499CEA40.1000907@bvwireless.net>
	<8763j6bvf5.fsf@macbook.be.48ers.dk> <499D717F.9010003@bvwireless.net>
Message-ID: <877i3ma26n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Malkowski <eric@bvwireless.net> writes:

Hi,

 Eric> To follow up briefly: In looking at the source in libbb it appears
 Eric> disabling CONFIG_FEATURE_EDITING_SAVEHISTORY will stop libbb from
 Eric> writing to ~/.ash_history
 Eric> Older versions I've used had SAVEHISTORY enabled but didn't
 Eric> dynamically load it from various instances of interactive shells
 Eric> causing thr cross-shell history sharing -- perhaps this is a new
 Eric> "feature".  I don't need the history saved and loaded constantly or on
 Eric> shell exit so I'll try turning that off.

Ok.

 Eric> Sorry for using the wrong list -- but at least you can see my
 Eric> reasoning for starting w/ the buildroot list.

No problem, it's just that (even though there's a certain overlap
between buildroot and busybox people) the busybox people normally know
the finer details of their program better than we do.

 Eric> If anything further is needed w/ this topic, I'll move over to the
 Eric> busybox list.

Thanks.

-- 
Bye, Peter Korsgaard
