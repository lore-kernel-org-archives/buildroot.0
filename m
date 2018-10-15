From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Oct 2018 07:21:44 +0200
Subject: [Buildroot] [PATCH 2/3] mdadm: move from /usr/sbin to /sbin
In-Reply-To: <20181014200056.20220-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 14 Oct 2018 22:00:55 +0200")
References: <20181014200056.20220-1-thomas.petazzoni@bootlin.com>
 <20181014200056.20220-2-thomas.petazzoni@bootlin.com>
Message-ID: <87murfokd3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The upstream Makefile by default installs to /sbin but we override
 > that to install it in /usr/sbin. Since mdadm is a pretty core utility
 > for the boot process, it makes sense to comply with upstream's default
 > behavior, so we change mdadm.mk to install mdadm in /sbin. This also
 > removes the somewhat non-standard DESTDIR value.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
