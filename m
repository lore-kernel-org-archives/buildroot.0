From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Mar 2013 21:17:43 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <20130304204731.3134cc5b569baf8ffeb5d3b0@kinali.ch>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <20130304204731.3134cc5b569baf8ffeb5d3b0@kinali.ch>
Message-ID: <20130304211743.7ff322e9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Attila Kinali,

On Mon, 4 Mar 2013 20:47:31 +0100, Attila Kinali wrote:

> How about
>   (3) Wait a couple of months to see where this whole udev mess goes to.
> 
> eudev is still pretty young and got started on the wrong foot (see the
> the very poor presentation at FOSDEM). How Lennart and Kai are treating
> non-systemd users is pretty much nazi like, IMHO and shows a great lack
> of understanding how diverse the linux ecosystem is. Not only do we have
> a lot of people who want a slim system that is easy to debug, there are
> also enough people who need to squeeze out every kB they can get. And
> these are left out by the current systemd development, because it doesn't
> fit into the vision of Lennart and Kai. 

Why the heck would people caring about every KB use udev in the first
place? Once again, we already have static /dev, devtmpfs and mdev
support, and those are *way* more lightweight than udev.

> So, to come back to the original issue, i would say just freeze the current
> version and wait a couple of months until it either becomes clear what will
> happen or incompatibilites force you to upgrade.

Our udev version is 182, released March 2012, almost a year ago.
Our systemd version is 44, released March 2012, almost a year ago.

I think we've already waited 12 months. Isn't that enough?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
