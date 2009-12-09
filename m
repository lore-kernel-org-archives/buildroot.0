From: NEAL, RYAN <RYAN_NEAL@appsig.com>
Date: Wed, 9 Dec 2009 11:20:12 -0800
Subject: [Buildroot]  RTNETLINK error
Message-ID: <4B2CB099CF3D4F40B1B1442281CA94FFC4C929@EXCHANGEVS01.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 

I was wondering if anyone could help me figure out why I am getting this
error:

 

Sending DHCP requests ., OK

IP-Config: Got DHCP answer from 0.0.0.0, my address is 10.49.211.5

IP-Config: Complete:

     device=eth0, addr=10.49.211.5, mask=255.255.240.0,
gw=10.49.223.254,

     host=10.49.211.5, domain=appsig.com, nis-domain=appsig.com,

     bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=

Freeing unused kernel memory: 932k init

Initializing random number generator... done.

Starting network...

ip: RTNETLINK answers: File exists

 

And then it hangs.  I looked through the inittab -> rcS -> S40network to
find that it is coming from the ifup call (on the loopback interface?).


I have seen some stuff that "explains" the problem, but I am still at a
loss.

Any insight or help would be great!

 

:: Ryan Neal

Office: 490/279

Phone: 408.774.2747

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091209/e510040e/attachment.htm>
