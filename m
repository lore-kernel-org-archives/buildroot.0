From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 30 May 2013 12:06:13 -0500
Subject: [Buildroot] [PATCH v9 03/14] libgtk2: bump to version 2.24.18
In-Reply-To: <20130530184859.3ace3c42@skate>
References: <1369931437-12445-1-git-send-email-spenser@gillilanding.com>
 <1369931437-12445-4-git-send-email-spenser@gillilanding.com>
 <20130530184859.3ace3c42@skate>
Message-ID: <CAEBucnD_Og0do1jj5AhSPCY=nfbfKHMOS7PAO2wPfUSc=g--jA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> Please mention explicitly in the commit log that you are dropping
> DirectFB support for good. Generally speaking, your commit log would
> need to be a little bit more detailed about what you're doing. No need
> to give gazillion of details, but highlighting the important changes is
> good when the bump is not simply a mechanical bump.
>
> Also, I believe more parts of libgtk2.mk can be removed if you remove
> DirectFB support:
>
> ifeq ($(BR2_PACKAGE_DIRECTFB),y)
>         LIBGTK2_CONF_OPT += --with-gdktarget=directfb
>         LIBGTK2_DEPENDENCIES += directfb
> endif
>
> and also all the code that was enclosed in a ifeq
> ($(BR2_PACKAGE_XORG7),y) can now go out of this conditional.

This has been fixed in the newest version.

> Or maybe you want to do two separate patches: one that drops the
> DirectFB support, and then one that bumps to 2.24.18.

I've update the patch title to

libgtk2: bump to version 2.24.18 and drop DirectFB

the commit message states.

 * Drop DirectFB support from libgtk2
 * bump libgtk2 to version 2.24.18

> Thanks!

Thanks,
Spenser


--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
