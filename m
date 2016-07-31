From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 20:22:51 +0200
Subject: [Buildroot] [PATCH] triggerhappy: unbreak build against 4.7+
	kernel headers
In-Reply-To: <1469953905-32195-1-git-send-email-peter@korsgaard.com> (Peter
 Korsgaard's message of "Sun, 31 Jul 2016 10:31:45 +0200")
References: <1469953905-32195-1-git-send-email-peter@korsgaard.com>
Message-ID: <87zioxr7k4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.org/results/3d0/3d07de291ec64a16d03e10f0cf1faeb19d546412/
 > http://autobuild.buildroot.org/results/b03/b03500e7d85786c6eee8f0adc38801340129aa14/
 > http://autobuild.buildroot.org/results/dd0/dd05caf0db318a9287d239cc6fa5470ccdc2ce7c/
 > http://autobuild.buildroot.org/results/76b/76bb000d041bd0828d15aa04138e222a4773ce94/

 > Triggerhappy used the wrong constants for array sizes, causing a compilation
 > error about out of array bounds initializers with the SW_PEN_INSERTED switch
 > event added in 4.7. Fix it by using the correct constants (<foo>_CNT) instead.

 > Patch submitted upstream: https://github.com/wertarbyte/triggerhappy/pull/12

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
