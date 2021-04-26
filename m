From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:14:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/libgeos: use specific bug
 instead of BR2_nios2 to disable package
In-Reply-To: <1e867adb-5f08-de1e-f187-cc04a2f28d12@mind.be> (Arnout
 Vandecappelle's message of "Mon, 26 Apr 2021 21:51:30 +0200")
References: <20210314233231.351fce1c@windsurf.home>
 <20210317163459.1916948-1-giulio.benetti@benettiengineering.com>
 <20210317163459.1916948-2-giulio.benetti@benettiengineering.com>
 <1e867adb-5f08-de1e-f187-cc04a2f28d12@mind.be>
Message-ID: <87lf94eoj4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 17/03/2021 17:34, Giulio Benetti wrote:
 >> Let's use the _BUG_ form for disabling this package instead of BR2_nios2
 >> architecture as we already use it for other packages.
 >> 
 >> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

 >  Applied to master, thanks. I made the following changes:

 >      - put 27597 after 21464 instead of before it;
 >      - propagate dependency to postgis;
 >      - mention the bugs in the comments.

 > postgis didn't exist yet at the time so that's no surpise... The rest is nitpicking.

Committed to 2021.02.x (without the postgis hunk), thanks.

-- 
Bye, Peter Korsgaard
