From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Feb 2013 22:41:27 +0100
Subject: [Buildroot] [PATCH] neard: fix missing nfc.h header
In-Reply-To: <1359898643-24467-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Feb 2013 14:37:23 +0100")
References: <1359898643-24467-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwvj3gfs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We have a patch that allows neard to build even on toolchain using old
 Thomas> kernel headers that lack the nfc.h header. However, after the bump to
 Thomas> neard 0.9, this patch was not updated to take into account the two new
 Thomas> plugins that neard has added.

 Thomas> Fixes http://autobuild.buildroot.org/results/5eeb6f62cc0e654a536b6614dc51e8af4e301bb6/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
