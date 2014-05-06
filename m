From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 May 2014 17:11:08 +0200
Subject: [Buildroot] [PATCH] nftables: disable dblatex check
In-Reply-To: <1399373985-12045-1-git-send-email-yegorslists@googlemail.com>
 (yegorslists@googlemail.com's message of "Tue, 6 May 2014 12:59:45
 +0200")
References: <1399373985-12045-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <87lhufeycz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:

 > From: Yegor Yefremov <yegorslists@googlemail.com>
 > On the systems with old dblatex (for example 3.0) the build step will
 > fail, because dblatex doesn't support '-q' parameter. This patch
 > overrides dblatex check.

 > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
