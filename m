From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 11:57:40 +0100
Subject: [Buildroot] [PATCH v3] qt: add font license information
In-Reply-To: <1456439689-16676-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Thu, 25 Feb 2016 23:34:49 +0100")
References: <1456439689-16676-1-git-send-email-ps.report@gmx.net>
Message-ID: <87si0es9nf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > With this implementation, the different licenses will be separated with
 > <space><comma>. This is not nice, but to avoid it a pretty ugly construct
 > is needed:

 > QT_LICENSE = $(shell echo $(QT_LICENSE_BITS) | sed 's% , %, %g')

 > Since the <space><comma> is just a minor nuisance, we're not going to that kind
 > of complexity.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
