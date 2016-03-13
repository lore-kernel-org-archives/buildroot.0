From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 21:19:11 +0100
Subject: [Buildroot] [PATCH 1/1] kbd: fix install to target
In-Reply-To: <1457888388-6429-1-git-send-email-niels@tonebarker.dk> (Niels
 Skou Olsen's message of "Sun, 13 Mar 2016 17:59:48 +0100")
References: <1457888388-6429-1-git-send-email-niels@tonebarker.dk>
Message-ID: <87egbegmgw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Niels" == Niels Skou Olsen <niels@tonebarker.dk> writes:

 > The package makefile attempted to append to KBD_INSTALL_TARGET_OPTS, but this
 > fails when done before evaluating $(autotools-package). This is because
 > autotools-package uses ?= to set default values. Instead of appending we now
 > override KBD_INSTALL_TARGET_OPTS.

 > Signed-off-by: Niels Skou Olsen <niels@tonebarker.dk>

Committed, thanks.

-- 
Bye, Peter Korsgaard
