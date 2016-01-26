From: FrAnKenStEiN MC <chfakht@gmail.com>
Date: Tue, 26 Jan 2016 00:37:34 +0000
Subject: [Buildroot] Buildroot with raspberry : can't connect with Hostname
Message-ID: <CABi8WTw-Cf9Hyjx8D57XDn+mnXEVEAFx2vX_s40xeiVhX_4kyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Finally ,
after using buildroot with raspberrypi_defconfig and add dropBear package
for SSH , i could now connect via ethernet to my raspberry.
I have defined the hostname in buildroot to be "pi" and using HDMI it
display pi login
but i can connect only by using root
like *ssh root at 10.42.0.6 <root@10.42.0.6>* (since i have definded a static
ip in cmdline.txt : but what is the difference between defining a static ip
adress in this file Vs doing it in /etc/networj/interfaces file
Whatever ,* i can't just connect using pi as user*

*cut -d: -f1 /etc/passwd*
*root*
*daemon*
*bin*
*sys*
*sync*
*mail*
*www-data*
*operator*
*ftp*
*nobody*

I think that i must add a new user ? but why pi is missing ? thanks a lot :)
?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160126/97c2b77d/attachment.html>
