From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Dec 2012 23:35:43 +0100
Subject: [Buildroot] [PATCH] libplayer: propagate 'depends on' from
	mplayer
In-Reply-To: <1356733021-15222-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 28 Dec 2012 23:17:01 +0100")
References: <1356733021-15222-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9sxyfcw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> BR2_PACKAGE_LIBPLAYER_MPLAYER should not select BR2_PACKAGE_MPLAYER
 Thomas> without having the 'depends on' that BR2_PACKAGE_MPLAYER has.

Committed, thanks.

-- 
Bye, Peter Korsgaard
