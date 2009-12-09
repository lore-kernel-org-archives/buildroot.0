From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Dec 2009 23:10:20 +0100
Subject: [Buildroot] RTNETLINK error
In-Reply-To: <4B2CB099CF3D4F40B1B1442281CA94FFC4C92B@EXCHANGEVS01.appsig.com>
	(RYAN NEAL's message of "Wed, 9 Dec 2009 14:06:12 -0800")
References: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com>
	<87vdgfx6ac.fsf@macbook.be.48ers.dk>
	<4B2CB099CF3D4F40B1B1442281CA94FFC4C92A@EXCHANGEVS01.appsig.com>
	<87ocm7x0q9.fsf@macbook.be.48ers.dk>
	<4B2CB099CF3D4F40B1B1442281CA94FFC4C92B@EXCHANGEVS01.appsig.com>
Message-ID: <87hbrzx0hf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == NEAL, RYAN <RYAN_NEAL@appsig.com> writes:

 Ryan> Because I am messing up the configuration :).  I want the kernel to come
 Ryan> up and setup the dhcp/dns so that the virtex5 is on the network,
 Ryan> pingable, ssh (eventually), ftp (eventually), etc.

DNS is normally not possible with the kernel IP autoconfig, you better
use the dhcp client in busybox for that.

 Ryan> This is some settings inside of the Xilinx kernel then?

Not if you use the busybox version.

Does the above work if you remove the ip=.. part of your kernel command
line?

-- 
Bye, Peter Korsgaard
