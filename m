From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 12:39:52 +0200
Subject: [Buildroot] [PATCH v2] Makefile: make help: remove <package>-
	help, add link to online manual
In-Reply-To: <1413109324-24401-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 12 Oct 2014 12:22:04 +0200")
References: <1413109039-23845-1-git-send-email-arnout@mind.be>
 <1413109324-24401-1-git-send-email-arnout@mind.be>
Message-ID: <87zjd1zi4n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > We only documented a few of the <package>- targets and it's hard to
 > decide which ones are relevant for make help. Since the help is already
 > way too long, it's better to remove these advanced targets.

 > Instead, let's refer to the online manual.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
 > ---
 > v2: move the link to the online manual to the bottom.

 > At the BR developer meeting we decided to go for this option.

 > A TODO item has been added to create a 'make <package>-help' target
 > that shows all the package-specific targets.

 > Perhaps something similar should be done for the defconfigs and
 > for the allyesconfig etc. targets as well.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
