From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 15:15:16 +0100
Subject: [Buildroot] [PATCH] arch: remove incorrect condition for endian
	definition on SuperH
In-Reply-To: <1391523034-7624-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 4 Feb 2014 15:10:34 +0100")
References: <1391523034-7624-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878utr6k23.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Probably due to some copy/paste mistake, Config.in.sh was defining
 > BR2_ENDIAN to "LITTLE" when the architecture is BR2_x86_64. Due to the
 > fact that Config.in.sh is never included when we are building for
 > x86_64, this is a no-op, but is certainly good to clean up.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
