From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Dec 2016 14:57:57 +0100
Subject: [Buildroot] logrotate error
In-Reply-To: <CA+12NBJSywCO=azSzUtUdSS3irhXTUnhNpcRL6Rr-R=g_9UbHQ@mail.gmail.com>
References: <CA+12NBJSywCO=azSzUtUdSS3irhXTUnhNpcRL6Rr-R=g_9UbHQ@mail.gmail.com>
Message-ID: <20161221145757.727602a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Dec 2016 08:22:34 -0500, Linux User wrote:

> I enabled the logrotate package through the menuconfig, and my compilation
> breaks. Can someone pls shed some light.

This type of error really smells like you did a first build, then
changed your Buildroot configuration, and restarted the build, without
doing a "make clean".

Can you please check if you can reproduce after a "make clean all" ?

In any case, please read
https://buildroot.org/downloads/manual/manual.html#full-rebuild.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
