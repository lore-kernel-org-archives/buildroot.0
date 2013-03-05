From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Mar 2013 19:15:17 +0100
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <CALo-6+izu2DJE6+PGDSFqQLz9tA=dF7DxEOS2rVcrdGjMwcapg@mail.gmail.com>
References: <20130304192156.7bfe23bf@skate> <1362471660.7276.2@driftwood>
 <CALo-6+izu2DJE6+PGDSFqQLz9tA=dF7DxEOS2rVcrdGjMwcapg@mail.gmail.com>
Message-ID: <20130305191517.378a1c82@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Tue, 5 Mar 2013 07:04:45 -0800, Charles Krinke wrote:
> As a user working on an AM3517 project with buildroot, I am having
> trouble seeing anything wrong with the existing implementation of
> mdev. We have 802.11 and USB disks that are plugged in and removed and
> the mdev subsystem seems to be working fine.
> 
> Having other alternatives is nice, but I hope we do not remove the
> existing mdev which appears to work fine in embedded systems.

There has never been any plan to remove mdev. We are talking about
possibility removing udev if systemd is not chosen as the init system.
That's all.

mdev will stay here, for sure.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
