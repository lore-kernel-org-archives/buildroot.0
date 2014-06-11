From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2014 12:53:29 +0200
Subject: [Buildroot] [PATCH 1/2] znc: add patch to add missing <time.h>
	inclusions
In-Reply-To: <1402434092-25323-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 10 Jun 2014 23:01:31 +0200")
References: <1402434092-25323-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqcniuom.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > With certain toolchains, znc fails to build due to missing <time.h>
 > inclusions. This commit fixes that by adding a patch that adds those
 > missing inclusions.

 > Fixes:

 >   http://autobuild.buildroot.net/results/86e/86e5e76a6ccc1396cd84107af63cdaa0ce1dfbee/

Committed both, thanks.

-- 
Bye, Peter Korsgaard
