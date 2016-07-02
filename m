From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Jul 2016 12:25:50 +0200
Subject: [Buildroot] [PATCH 1/4] Package netsnmp: Created start(), stop(),
	reload().
In-Reply-To: <20160701150121.7eebcb5e@free-electrons.com> (Thomas Petazzoni's
 message of "Fri, 1 Jul 2016 15:01:21 +0200")
References: <1456435484-4723-1-git-send-email-universeII@gmx.de>
 <20160701150121.7eebcb5e@free-electrons.com>
Message-ID: <87bn2g9w0h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 25 Feb 2016 22:24:41 +0100, Andreas Ehmanns wrote:
 >> Changed init script to get rid of double code.
 >> Start, stop and reload code has been put into
 >> separate functions and 'restart' will just call
 >> stop() and start() with a delay in between.
 >> 
 >> Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
 >> ---
 >> package/netsnmp/S59snmpd | 71 +++++++++++++++++++++++++-----------------------
 >> 1 file changed, 37 insertions(+), 34 deletions(-)

 > Entire series applied, after tweaking the commit titles and in some
 > cases the commit log.

For the future, please use your full name in the From: as well (git
commit user.name "Andreas Ehmanns"). Now these commits are listed as
being from "universe II".

Thanks.

-- 
Bye, Peter Korsgaard
