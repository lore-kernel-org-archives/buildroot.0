From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 14:37:33 +0200
Subject: [Buildroot] [PATCH] x11r7: xf86-input-tslib: upgrade to 1.0.0
In-Reply-To: <20170514075026.13434-1-martink@posteo.de>
References: <20170514075026.13434-1-martink@posteo.de>
Message-ID: <20170514143733.5fa069e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 May 2017 09:50:26 +0200, Martin Kepplinger wrote:
> As the update from 0.0.X to 1.0.0 suggests, this is a major update. The driver
> uses X11's touch API now, instead of motion with button emulation. Furthermore
> it supports multitouch when a recent version of tslib is installed.
> 
> It is not backwards compatible for very old versions of the X server. See
> https://github.com/merge/xf86-input-tslib/releases for some details.

What do you call "very old versions of the X server" ?

Buildroot still supports the X server in version 1.14.7. Does this
qualify as a "very old version" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
