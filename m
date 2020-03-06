From: Hammami Omar <omar18hammami@gmail.com>
Date: Fri, 6 Mar 2020 11:12:28 +0100
Subject: [Buildroot] /dev/hwrng no such device error
Message-ID: <CAGSpp9ms_HhhpGAcTz+34TxfUQ9pfNsK4pr4DO6MN4cLjn3sPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am trying to gather more entropy in my nonblocking pool.
So I have compiled the the *rng-tools* module via buildroot, and I have
activated the *HW_RANDOM_INTEL* in the  kernel configuration.
However, I cannot read from /dev/hwrng and I cannot execute the rngd
service.
I have these messages :
*# rngd -v*




*read errorread errorAvailable entropy sources:        Intel/AMD hardware
rng        DRNG*

Also, the  file */sys/class/misc/hw_random/rng_available* is empty. And,
the" */sys/class/misc/hw_random/rng_current*" has "*none*"

Did anyone faced the same problem before ?

Kind regards,
Omar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200306/ddead772/attachment.html>
