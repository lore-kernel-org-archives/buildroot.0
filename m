From: Michael Schweikart <micky@schweikarts-vom-dach.de>
Date: Wed, 11 Nov 2015 09:47:50 +0100
Subject: [Buildroot] issue with dhcp on buildroot
Message-ID: <2864886.JM8PMHTYst@mars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i have setup a buildroot environment and build it. I deploy it on device under 
test and the systems boots up(Kernel Version 4.3). As soon as the network and 
udhcpc (v1.24.1) starts i get the following messages. 

Sending discover...
udhcpc: sendto: Invalid argument.
Sending discover...
udhcpc: sendto: Invalid argument.
No lease, failing

If i setup an static ip address i am able to ping the device under test. I try 
to ping a IP form the device under test i get the following error.

ping: sendto: Destination address required

Is there anybody out there how can support me?

best regards
