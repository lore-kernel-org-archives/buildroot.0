From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:17:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for
 older kernel/u-boot
In-Reply-To: <20181008115146.17797-1-lothar.felten@gmail.com> (Lothar Felten's
 message of "Mon, 8 Oct 2018 13:51:46 +0200")
References: <20181008115146.17797-1-lothar.felten@gmail.com>
Message-ID: <87woq7a698.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lothar" == Lothar Felten <lothar.felten@gmail.com> writes:

 > Patch dtc to accept libfdt include guards with and without leading underscore.
 > A compiler warning is added to notify the user.

 > Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
