From: =?ISO-8859-1?Q?Santi_L=F3pez?= <lopezsanti99@gmail.com>
Date: Sun, 12 Sep 2010 08:37:46 +0200
Subject: [Buildroot] Access usb devices from buildroot
Message-ID: <AANLkTimDsQD=fzYMzVrFxEO8NUYnqQqCx-ZGa-0NH3Ws@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!



I have a doubt about the usb devices under buildroot.



I?m working with the last release, the ?2010.08?. I successfully created an
image under the cramfs format.

I?m able to boot with this image using the same kernel that use my host
machine, a complete kernel from the distribution.



I?m using an usb stick. I can boot without any problem.



But I can?t mount this usb stick for see other partitions or another stick
in other usb port.



The /var/log/messages don?t reflect any change when I connect a new usb
stick.



At boot time, the original usb stick is detected as /dev/sda1, but, once in
the console, I can?t mount this unit.



I forget something in the buildroot configuration?



Thanks in advance,

Santi L?pez.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100912/5cb07364/attachment.html>
