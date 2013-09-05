From: Woody Wu <narkewoody@gmail.com>
Date: Thu, 5 Sep 2013 16:19:19 +0800
Subject: [Buildroot] GTK+ for framebuffer?
In-Reply-To: <20130905091054.51fd4ce0@skate>
References: <20130903100905.GA324@zuhnb712.ap.bm.net>
 <20130903133145.370bb2d4@skate>
 <20130904024019.GA875@zuhnb712.ap.bm.net>
 <20130904093510.031f559b@skate>
 <20130905060235.GA15735@zuhnb712.ap.bm.net>
 <20130905091054.51fd4ce0@skate>
Message-ID: <20130905081919.GB15735@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 05, 2013 at 09:10:54AM +0200, Thomas Petazzoni wrote:
> Dear Woody Wu,
> 
> On Thu, 5 Sep 2013 14:02:35 +0800, Woody Wu wrote:
> 
> > Many thanks for your information.  Now I feel more clear that I should
> > go Gtk/X.org.  On the other side, I have no experience on running x.org
> > on an embeded system. What things in buildroot I should enable to build
> > a minimal system that can at lest run the gtk demons on TinyX? My
> > display is just framebuffer. I understand, the question may sounds a
> > little stupid.  Looking forward for your help.
> 
> I believe to get things started enable BR2_PACKAGE_XORG7, enable
> BR2_PACKAGE_XSERVER_XORG_SERVER, keep the KDrive/Tiny-X server type,
> and enable BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE_EVDEV.
> 
> Then, you will have Xfbdev on your target, which is the X server. It
> has a bunch of options that allows you to specify which evdev device to
> use as a mouse and as a keyboard, if you have such input devices on
> your system.
> 

Okay! I will try :-)

> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

-- 
I can't go back to yesterday - because I was a different person then
