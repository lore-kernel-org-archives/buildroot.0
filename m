From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Dec 2008 14:42:39 +0100
Subject: [Buildroot] [PATCH 1/4] package/udev: fix dependency for scsi_id
In-Reply-To: <1228708697.392615.378550596058.1.gpush@pingu> (Jeremy Kerr's
	message of "Mon\, 08 Dec 2008 14\:58\:17 +1100")
References: <1228708697.392615.378550596058.1.gpush@pingu>
Message-ID: <87vdtuzsts.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jeremy" == Jeremy Kerr <jk@ozlabs.org> writes:

 Jeremy> According to udev.mk, the scsi_id package depends on the
 Jeremy> libvolume_id library, so add this dependency to Config.mk

Thanks, committed all 4 (from r24318 on).

-- 
Bye, Peter Korsgaard
