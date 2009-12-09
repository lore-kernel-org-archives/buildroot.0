From: NEAL, RYAN <RYAN_NEAL@appsig.com>
Date: Wed, 9 Dec 2009 14:06:12 -0800
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <87ocm7x0q9.fsf@macbook.be.48ers.dk>
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com><87vdgfx6ac.fsf@macbook.be.48ers.dk><4B2CB099CF3D4F40B1B1442281CA94FFC4C92A@EXCHANGEVS01.appsig.com>
	<87ocm7x0q9.fsf@macbook.be.48ers.dk>
Message-ID: <4B2CB099CF3D4F40B1B1442281CA94FFC4C92B@EXCHANGEVS01.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because I am messing up the configuration :).  I want the kernel to come
up and setup the dhcp/dns so that the virtex5 is on the network,
pingable, ssh (eventually), ftp (eventually), etc.

This is some settings inside of the Xilinx kernel then?

::Ryan

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
Korsgaard
Sent: Wednesday, December 09, 2009 2:05 PM
To: NEAL, RYAN
Cc: Peter Korsgaard; buildroot at busybox.net
Subject: Re: [Buildroot] RTNETLINK error

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

 Ryan> I am actually not trying to boot from an NFS.  I just want to use
an
 Ryan> initramfs.

Ok, why are you then using the kernel ip autoconfig stuff that is
normally only used to boot from NFS?

 Ryan> output/target% cat etc/network/interfaces
 Ryan> # Configure Loopback
 Ryan> auto lo
 Ryan> iface lo inet loopback

 Ryan> that all seems reasonable?  I thought I turned off NFS as an
option in
 Ryan> buildroot.

Yes, looks fine.

-- 
Bye, Peter Korsgaard
