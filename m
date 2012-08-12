From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 19:27:05 +0200
Subject: [Buildroot] [PATCH v5 0/2] usb_modeswitch update and add data
In-Reply-To: <1332034235-17423-1-git-send-email-jwoltz@gmail.com>
References: <1332034235-17423-1-git-send-email-jwoltz@gmail.com>
Message-ID: <20120812192705.1cb61a9c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 17 Mar 2012 21:30:33 -0400,
"J.C. Woltz" <jwoltz@gmail.com> a ?crit :

> These two patches update usb_modeswitch to the latest version and add the data
> files in a separate package. 
> 
> The first patch updates usb_modeswitch to version 1.2.3. usb_modeswitch 
> itself includes bug fixes and a few new device additions.
> 
> The second patch is an addition for buildroot. It adds the usb_modeswicth_data
> which is very helpful. It contains rules for many devices. On most systems,
> these two programs are installed together. This data package contains udev
> rules to automatically switch the device on detection. 
> 
> The second patch also depends on the tcl patch sent in. This way 
> usb_modeswitch_data can select tclsh in order to get tcl. 
> 
> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
> 
> J.C. Woltz (2):
>   usb_modeswitch: update to 1.2.3
>   new program: usb_modeswitch_data

I guess you won't believe me, but anyway, it's true: I have merged your
changes. I did some minor modifications to them (bump usb_modeswitch to
1.2.4, and usb_modeswitch_data to the latest available version, do some
minor fixes, add license information, etc.).

I sincerely would like to apologize for the unacceptable delay that you
had to wait to see these patches merged. I would however really hope
that this will not discourage you from posting more patches to
Buildroot in the future, as your contributions are very welcome. You
said some time ago that you had more packages to contribute, please
don't hesitate to do so, I promise we'll try to be more responsive this
time.

Again, thanks a lot for your contributions,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
