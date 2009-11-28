From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 28 Nov 2009 20:06:05 +0100
Subject: [Buildroot] BB update Was:  Build jobbing
In-Reply-To: <200911280935.57255.minimod@morethan.org> (Michael S. Zick's
	message of "Sat\, 28 Nov 2009 09\:35\:54 -0600")
References: <200911271522.58858.minimod@morethan.org>
	<87tywe4ube.fsf@macbook.be.48ers.dk>
	<200911280813.12919.minimod@morethan.org>
	<200911280935.57255.minimod@morethan.org>
Message-ID: <87pr724ggy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael S Zick <minimod@morethan.org> writes:

Hi,

 Michael> The build didn't get far enough to find out, it looks like it broke
 Michael> on the recent scsi commit:

 Michael> In file included from miscutils/eject.c:20:
 Michael> /Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h:145: error: expected specifier-qualifier-list before ?u8?
 Michael> /Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h: In function ?scsi_varlen_cdb_length?:
 Michael> /Builds/BLDRT/br-head/output/toolchain/linux/include/scsi/scsi.h:156: error: ?struct scsi_varlen_cdb_hdr? has no member named ?additional_cdb_length?

What kernel headers version are you using? I checked in a fix for
2.6.31.6 kernel headers today (c589012eecd)

-- 
Bye, Peter Korsgaard
