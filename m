From: Attila Kinali <attila@kinali.ch>
Date: Tue, 5 Mar 2013 10:53:15 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <20130304211743.7ff322e9@skate>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <20130303195436.49654719@skate>
 <20130304204731.3134cc5b569baf8ffeb5d3b0@kinali.ch>
 <20130304211743.7ff322e9@skate>
Message-ID: <20130305105315.87f8750467e5901e0c0a26e0@kinali.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 4 Mar 2013 21:17:43 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Why the heck would people caring about every KB use udev in the first
> place? Once again, we already have static /dev, devtmpfs and mdev
> support, and those are *way* more lightweight than udev.

Ok, i might have exagerated. But still, systemd is a lot more heavyweight
than standard sysV init. Not to talk about the added complexity that
has very little benefit, especialy for embedded systems.
 
> > So, to come back to the original issue, i would say just freeze the current
> > version and wait a couple of months until it either becomes clear what will
> > happen or incompatibilites force you to upgrade.
> 
> Our udev version is 182, released March 2012, almost a year ago.
> Our systemd version is 44, released March 2012, almost a year ago.
> 
> I think we've already waited 12 months. Isn't that enough?

Uhmm.. oh..kay... 

I don't know, 1 year is a damn long time in opensource. And yes,
I agree that there should be an update soonish. But forcing people
to either use an old Buildroot release or to swallow systemd isn't
a very nice prospect either. 

All of that being said, I'm not a developer, so please regard this
as only my opinion as a mere user. I'm not trying to push the decision
in any way or other.

			Attila Kinali

-- 
The trouble with you, Shev, is you don't say anything until you've saved
up a whole truckload of damned heavy brick arguments and then you dump
them all out and never look at the bleeding body mangled beneath the heap
		-- Tirin, The Dispossessed, U. Le Guin
