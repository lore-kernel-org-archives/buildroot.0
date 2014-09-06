From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 06 Sep 2014 22:11:55 +0200
Subject: [Buildroot] [PATCH] nfs-utils: create /var/lock/subsys
In-Reply-To: <1410011439-15274-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Sep 2014 15:50:39 +0200")
References: <1410011439-15274-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvg4o6es.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The NFS server needs to create files in /var/lock/subsys/, but this
 > directory doesn't exist in our skeleton. This commit makes sure it
 > gets created by the S60nfs startup script, which fixes the operation
 > of the NFS server (tested with rpcbind).

 > Reported-by: Ofer Heifetz <oferh@marvell.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
