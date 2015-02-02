From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Feb 2015 18:08:50 +0100
Subject: [Buildroot] [PATCH 1/4] matchbox-panel: specify optional
	dependency on wireless_tools
In-Reply-To: <1422887940-31198-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Mon, 2 Feb 2015 15:38:57 +0100")
References: <1422887940-31198-1-git-send-email-arnout@mind.be>
Message-ID: <87zj8wgs0t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Make sure build is reproducible and doesn't depend on the order.
 > There is no corresponding configure option, but configure looks for
 > iwlib.h

 > Cc: Jean-Paul Etienne <fractalclone@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed series, thanks.

-- 
Bye, Peter Korsgaard
