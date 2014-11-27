From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 22:57:44 +0100
Subject: [Buildroot] [PATCH] system/device_table.txt: add /dev/null entry
In-Reply-To: <20141127201445.GD4690@tarshish> (Baruch Siach's message of "Thu, 
 27 Nov 2014 22:14:45 +0200")
References: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
 <20141127203720.10997803@free-electrons.com>
 <20141127201445.GD4690@tarshish>
Message-ID: <87h9xknw6f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

>> Baruch, do you agree with this proposal?

 > Supporting a non devtmpfs with mdev only requires creating /dev/null and 
 > /dev/console statically. I think this is a small price to pay for an 
 > out-of-the-box working build. Anyway, I don't feel strongly about it. I can 
 > easily work around the problem with a custom device table file, at least as 
 > long as I haven't rebuilt the kernel.

That might be true today, but the point is that it doesn't get any
testing so chances are something else will break in the future. It looks
like the issue you reported today has been present for several years.


 > By the way, the kernel that comes with this board IS 2.6.32, and we have just 
 > now started development based on the SoC on the board.

Poor you. I'm currently stuck on 2.6.37 for a project, so I know your
pain :/

-- 
Bye, Peter Korsgaard
