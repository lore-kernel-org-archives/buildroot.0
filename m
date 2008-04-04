From: Arun Reddy <reddyac@gmail.com>
Date: Fri, 4 Apr 2008 16:23:52 -0700
Subject: [Buildroot] Compiled buildroot with iso,
	error during boot "can't open /dev/ttyX: No such device or address"
Message-ID: <326f33790804041623l65cb5bfbub116b5391ff6ff3c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I have compiled buildroot and created a .iso image that I am now trying to
use to boot a new kernel on VirtualBox. Unfortunately, during boot I am
given consistent errors saying:

can't open /dev/tty1: No such device or address or tty2, tty3, up to tty5.

I looked online and it seems that the reason this occurs is because I don't
have enough Virtual terminals to support all the users. The key lies in
populating /dev/tty, but I am wondering how I can do this in buildroot? Does
anyone know what I must set within Buildroot to avoid this problem, and then
recompile again to get a new iso image that will boot fine without any
problems?

Thank you in advance for your response.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080404/a0616e42/attachment.htm 
