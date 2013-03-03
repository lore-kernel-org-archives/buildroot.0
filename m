From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Mar 2013 19:26:30 +0100
Subject: [Buildroot] Google Summer of Code 2013
In-Reply-To: <51338DA1.3090000@relinux.de>
References: <20130209004253.207e0741@skate>
 <201302131955.35889.yann.morin.1998@free.fr>
 <20130214152547.555d4553@skate> <20130303144339.7c5a189a@skate>
 <51338DA1.3090000@relinux.de>
Message-ID: <20130303192630.4e730af4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephan Hoffmann,

On Sun, 03 Mar 2013 18:51:29 +0100, Stephan Hoffmann wrote:

> I think all the suggestions are good, but the ARM SoC multimedia
> libraries are most important. These chips seem to become very popular,
> especially since there are low-cost platforms available as Beaglebone,
> Pengwyn, Wandboard or Raspberry Pi. As I have seen at the Embedded World
> in Nuremberg last week there are lots of industrial grade boards and
> modules especially with iMX5x, iMX6 and AM335x available or introduced.
> I expect that these systems will get a significant market share soon. So
> it might be really important to have good support for them in buildroot.
> 
> There are gazillions of such SoC available, but I think that Freescale
> and Texas are the most wide spread. Of course we cannot leave out RPi,
> although  I do not think that it has a significance in the industrial
> sector.
> 
> Maybe we should think about splitting this up into different projects,
> since the three platforms might be to much for one student.

I think we should maybe get started with only one GSoC project, since
we don't have much experience in mentoring a student.

The only issue with the topic related to multimedia packages for ARM
SoCs is that it requires some hardware, and I'm not sure where to get
the funding for that. Google says they pay $500 to the mentoring
organization, but I think this gets paid at the end of the GSoC, and
anyway we don't have any legal organization to receive this money.

Another solution is to get a little bit of sponsoring: getting one
BeagleBone and one i.MX6 based board sponsored shouldn't be too hard.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
