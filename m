From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Mon, 15 Aug 2011 16:23:21 +0200
Subject: [Buildroot] [PATCH] package: add Fluxbox 1.3.1 window manager
In-Reply-To: <4E49213F.2040401@visionsystems.de>
References: <20110803192301.4d5c4462@gmail.com>
 <4E49213F.2040401@visionsystems.de>
Message-ID: <20110815162321.268fd413@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 15 Aug 2011 15:38:07 +0200,
Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :

> 
> I've tried the patch and after installing xdm I can start the window
> manager. What is basic buildroot configuration to get keboard and
> mouse working?
> 
> Yegor 


I use X.Org (not TinyX), with the following drivers for input :

xf86-input-evdev
xf86-input-keyboard
xf86-input-mouse
xf86-input-synaptics (optional, if you have a touchpad)

I guess you might need udev support too.
