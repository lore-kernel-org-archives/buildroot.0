From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 May 2015 22:42:55 +0200
Subject: [Buildroot] [PATCH v8] python-pyxml: new package
In-Reply-To: <1430496084-22705-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 1 May 2015 18:01:24 +0200")
References: <1430493225-19081-1-git-send-email-arnout@mind.be>
 <1430496084-22705-1-git-send-email-arnout@mind.be>
Message-ID: <87mw1ouj00.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > From: Clayton Shotwell <clshotwe@rockwellcollins.com>
 > It always uses its own copy of pyexpat, but we can at least make it use
 > buildroot's expat.so.

 > Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > Changes:
 > 	v8: Remove unrelated musl fix (Arnout)

Committed with a 'select BR2_PACKAGE_EXPAT' added, thanks.

-- 
Bye, Peter Korsgaard
