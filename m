From: Ajay Sharma <linuxnajay@gmail.com>
Date: Tue, 15 May 2007 18:23:20 -0700
Subject: [Buildroot] Busybox console wont show up
In-Reply-To: <1b0abb4c0705151426h733d9491xdd5228fe3d980ea@mail.gmail.com>
References: <1b0abb4c0705141717m43eeef65r4e0a593e21dc87e7@mail.gmail.com>
	<1179263458.29753.7.camel@localhost>
	<1b0abb4c0705151426h733d9491xdd5228fe3d980ea@mail.gmail.com>
Message-ID: <1b0abb4c0705151823g2b1962dbr887718c64c435a37@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Yesterday I reported having problems with busybox login not showing up after
i was successfully able to create both a kernel and system image for
ixp425(ARM big-endian) reference board.
Well I got the problem solved today. It was a simple busybox rebuild.

$make busybox-menuconfig
configure busybox according to requirements
and then
$make busybox
$make

then copy the image to the target.
It should boot.
For reference I have attached a .config file for the busybox....

Right now ...I am having trouble login in ...Whats the PASSWORD for the
root? LOL
I will figure it out..!!

Thanks and regards.
-Ajay
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070515/b503ef9d/attachment-0001.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: busybox.config
Type: application/octet-stream
Size: 17638 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070515/b503ef9d/attachment-0001.obj 
