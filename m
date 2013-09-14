From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Sep 2013 07:51:43 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: enable sfdisk in configs
In-Reply-To: <87mwnnxee5.fsf@dell.be.48ers.dk>
References: <1376591640-3698-1-git-send-email-vsergeev@kumunetworks.com>
 <87mwnnxee5.fsf@dell.be.48ers.dk>
Message-ID: <20130914075143.295e24de@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 08 Sep 2013 22:11:14 +0200, Peter Korsgaard wrote:

> Ehh, I don't see any --enable-sfdisk / --disable-sfdisk configure
> options?
> 
>  ./configure --help|grep -B2 sfdisk
>   --enable-static-programs=LIST
>                           link static the programs in LIST (comma-separated,
>                           supported for losetup, mount, umount, fdisk, sfdisk,

The patch from Ivan predates the recent util-linux bump. I'm pretty
sure there was a sfdisk option, because I remember testing Ivan's
patch, but it was before the util-bump.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
