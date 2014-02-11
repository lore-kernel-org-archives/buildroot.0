From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Feb 2014 10:07:14 +0100
Subject: [Buildroot] [PATCH] rpcbind: uses fork(), needs MMU
In-Reply-To: <1392109375-19568-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 11 Feb 2014 10:02:55 +0100")
References: <1392109375-19568-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2iuvwzh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Fixes:
 >   http://autobuild.buildroot.net/results/d7c/d7c788749b54275154cc3934a7a32385cd72be61/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
