From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 14:28:41 +0100
Subject: [Buildroot] [PATCH] elfutils: download portability patch
In-Reply-To: <1417440275-24539-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 1 Dec 2014 10:24:35 -0300")
References: <1417440275-24539-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a937h52u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Download the portability patch into the buildroot tree.
 > This isn't nice but there really isn't another good solution for it.
 > The elfutils-portability.patch is version-dependent hence we already
 > have an older version for an older version of elfutils in the mirrors.
 > This causes hash check failures when fetching from sources.buildroot.net
 > But we can't remove (hence replace) the old version with the new one
 > since this would causee issues with older versions of
 > buildroot/elfutils for the same scenario.

 > Fixes:
 > http://autobuild.buildroot.net/results/26a/26afb92dc14fd0f85c0800dd4e034ea86af19fe2/

yeah, non-unique file names sucks :/

Committed, thanks.

-- 
Bye, Peter Korsgaard
