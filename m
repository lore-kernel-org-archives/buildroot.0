From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Mar 2012 08:56:34 +0100
Subject: [Buildroot] [RFC] Request for comment for branch
 for-2012.05/misc-cleanups
In-Reply-To: <CAAXf6LWhUefC7igy8nbDLdJT-o4o36QoX_9xcVUri6a=tSryTg@mail.gmail.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LWhUefC7igy8nbDLdJT-o4o36QoX_9xcVUri6a=tSryTg@mail.gmail.com>
Message-ID: <20120309085634.4e49ae98@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 9 Mar 2012 08:06:23 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Thanks for this cleanup. I think the reorganization of the *targets
> infrastructure and the move of its related bits from other files will
> certainly make the whole cleaner. And I also like the removal of the
> unneeded variables.
> 
> I tried validating these patches by grepping/reviewing the code, and I
> don't really expect surprises related to broken stuff. But of course,
> it's good that you do some further testing.

And still: I did test them a bit yesterday, and it seems they were some
problems (but I didn't investigate too much, my testing was
unintentional: I had forgotten to move to another branch to work on a
customer project).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
