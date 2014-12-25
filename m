From: thebestofall007 . <loucrittenden63@gmail.com>
Date: Thu, 25 Dec 2014 14:09:38 -0600
Subject: [Buildroot] building fbtft framebuffer drivers into buildroot.
Message-ID: <CAFGceHGR2k7ARYDZqK0pskkNbd6wiguLkMdZ07zpPENW+NAZxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I am new to buildroot and have been feeling my way around it, but I
currently have a very fast bootable buildroot system for my raspberry pi
system set up following various rpi setup tutorials, and I was wondering
where I can start on building a package for the fbtft drivers from their
source code located in the git repository located here:
https://github.com/notro/fbtft/ that are used for driving small lcd
displays, or has this already been done before?

I want to be able to use a small 3.2" raspberry pi display shield as the
default display with buildroot, and although I have had good luck setting
up those drivers within raspbian os and raspbmc and having it work with my
lcd model, I want a much faster, leaner setup that boots in seconds yet is
customizable (as buildroot does with flying colors!)..

I have went through the manual, and while it has a lot of info, this is an
area that seems to be a little less self explanatory. I also gave info from
this site a try, but I'm stuck at the making of the .mk file:
http://free-electrons.com/~thomas/buildroot/manual/html/ch11.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141225/fe92b4db/attachment.html>
