From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Mar 2012 13:12:41 +0100
Subject: [Buildroot] [PATCH] libethumb: Fix automagic dependencies on
	libedbus and libexif
In-Reply-To: <1331471700-17563-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 11 Mar 2012 14:15:00 +0100")
References: <4F54C2BC.8090703@imgtec.com>
 <1331471700-17563-1-git-send-email-arnout@mind.be>
Message-ID: <87obs0lmx2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: Markos Chandras <markos.chandras@imgtec.com>

 Arnout> libethumb will determine during configuration phase whether to
 Arnout> build the optional libexif and libedbus modules. It will enable
 Arnout> this modules if libedbus or libexif are present on the target
 Arnout> system. Therefore, we need to add these packages as optional
 Arnout> dependencies to libethumb.

 Arnout> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Arnout> ---
 Arnout> Arnout: Resending as in-line patch for easy review.
 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks - But your signed-off-by should go before the '---'

-- 
Bye, Peter Korsgaard
