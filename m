From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Jan 2012 08:44:19 +0100
Subject: [Buildroot] [PATCH] Add ttyO devices to the mdev configuration
 and the static device table.
In-Reply-To: <CA+-urNT0KPeUy9ST0UndxjkGeUNEYSap3KKGifc8WT6EFTwdEg@mail.gmail.com>
References: <1325438796-3287-1-git-send-email-fhunleth@troodon-software.com>
 <20120101215010.3911add4@skate>
 <CA+-urNT0KPeUy9ST0UndxjkGeUNEYSap3KKGifc8WT6EFTwdEg@mail.gmail.com>
Message-ID: <20120102084419.6fdf1173@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 1 Jan 2012 20:03:04 -0500,
Frank Hunleth <fhunleth@troodon-software.com> a ?crit :

> Got it. That makes sense.
> 
> What about the other part of the patch for adding ttyO to mdev.conf? That
> one is more important to me since I am currently using mdev (and probably
> shouldn't have tried to cram the static dev table change in the patch
> anyway).

That part of the patch makes sense. Can you submit it separately?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
