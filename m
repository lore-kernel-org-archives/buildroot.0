From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Nov 2012 08:19:10 +0100
Subject: [Buildroot] proc mount needed in both inittab and fstab?
In-Reply-To: <CANxTyt7FzVFqwS8Rx1-W=sgoatYE9NZkCeedUf6mWDkd4Q9zwA@mail.gmail.com>
References: <CANxTyt7FzVFqwS8Rx1-W=sgoatYE9NZkCeedUf6mWDkd4Q9zwA@mail.gmail.com>
Message-ID: <20121108081910.7e3bfd21@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Wed, 7 Nov 2012 21:53:15 -0500, Danomi Manchego wrote:

> I was wondering - is the /proc mount in inittab needed, since there is a
> corresponding line in fstab?

I /think/ yes, because I believe 'mount -a' needs /proc/mounts to be
available in order to work properly.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
