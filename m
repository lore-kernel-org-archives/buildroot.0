From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Apr 2010 09:19:04 +0200
Subject: [Buildroot] 2.6.33.2 kernel headers patch
In-Reply-To: <3C3F38C6-6CB3-4F69-ACF7-3229CB42C39F@me.com> (Thomas
	Brandstetter's message of "Sat, 03 Apr 2010 14:39:12 +0200")
References: <3C3F38C6-6CB3-4F69-ACF7-3229CB42C39F@me.com>
Message-ID: <87ljczraqf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Brandstetter <thomas.brandstetter@me.com> writes:

Hi,

 Thomas> This error indicates, that the patch:

 Thomas> linux-2.6.32.11-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

 Thomas> should also be applied to the latest kernel headers eq.

 Thomas> linux-2.6.33.2-scsi-use-__uX-types-for-headers-exported-to-user-space.patch

 Thomas> Can someone confirm this?

Yes - Fixed in git.

-- 
Bye, Peter Korsgaard
