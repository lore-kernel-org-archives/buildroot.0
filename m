From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Thu, 25 Jun 2015 10:54:28 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Warpboard
In-Reply-To: <558B254C.2090606@mind.be>
References: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
 <558B254C.2090606@mind.be>
Message-ID: <20150625085428.GA3400@arthur-dreem>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

Le Wednesday 24 Jun 2015 ? 23:46:52 (+0200), Arnout Vandecappelle a ?crit :
> > +
> > +Enable bluetooth
> > +================
> > +hciattach /dev/ttymxc4 any
> > +hciconfig hci0 up
> > +
> > +Enable Wifi
> > +==========
> > +modprobe brcmfmac
> > +ifconfig wlan0 up
> 
>  To do something useful, you'll also need a wpa-supplicant I guess...
> 
>  Since you anyway have a rootfs overlay, you could add init scripts to start
> wifi and bluetooth. We don't usually do that, but I think it would be a good idea.

In fact I need bluez-util (to be able to run hciattach command also). And yes I also need wpa_supplicant for wifi.
So ok I will enable these two packages and add init script

I will fix the other things that you suggest. Thanks for the review.

Regards,
Arthur.
