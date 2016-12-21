From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 11:15:00 +0100
Subject: [Buildroot] [PATCH] uclibc: add patch to fix <stdlib.h>
In-Reply-To: <1482186391-28787-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Dec 2016 23:26:31 +0100")
References: <1482186391-28787-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8737hh6123.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit adds a patch to <stdlib.h>, to fix a bug introduced in
 > uClibc-ng 1.0.20, and which was causing build failures for at least one
 > package in Buildroot: freeswitch.

 > Fixes:

 >   http://autobuild.buildroot.net/results/12c246b058224f68494b84355a29dc4efb85df6d/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
