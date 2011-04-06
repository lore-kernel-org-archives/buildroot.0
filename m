From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Apr 2011 15:32:54 +0200
Subject: [Buildroot] [PATCH 63/63] udev: upgraded to version 151
In-Reply-To: <1302084257-30775-64-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
	<1302084257-30775-64-git-send-email-a@awn.dk>
Message-ID: <20110406153254.7c943d28@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Apr 2011 12:04:17 +0200
"Allan W. Nielsen" <a@awn.dk> wrote:

>  - Changed udev.mk to use autotargets
>  - removed the volume_id library
> 
> Signed-off-by: Allan W. Nielsen <a@awn.dk>

I have already merged in one of my branch a more recent version of udev
contributed by another Buildroot contributor, which I have further
bumped to udev 166.

This will be part of the set of changes adding "udisks" that I'm
currently working on.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
