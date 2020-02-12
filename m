From: Sebastien Claudel <s.claudel@guinault.com>
Date: Wed, 12 Feb 2020 17:21:00 +0100
Subject: [Buildroot] begalebone_qt5_defconfig release
Message-ID: <6f9f8d5e.1d5e1c0.6009e15.2727@guinault.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
 
I am trying to use the sgx graphic accelerator of my beaglebone black with the buildroot config beaglebone_qt5_defconfig  .
 
The master branch use wayland and does not seem to support opengl. I would prefer to not have wayland or weston and write directly to the frame buffer. I already tried to install mesa3d with DRI swrast driver but it does not works to.
 
Have you an idea of how to make, sgx driver and opengl, works on beaglebone black ?
 
Which release of buildroot is the best to use for my case ? 
 
Thank you
 
S?bastien CLAUDEL
Ing?nieur syst?mes embarqu?s
 
Guinault SA
PAOS La Saussaye - 95 rue du rond d'eau
F-45590 - Saint Cyr-en Val -France
www.guinault.com
info at guinault.comRCS Orl?ans B 569 800 725
SIRET 569 800 725 00040
APE 2711Z
TVA FR 93 569 800 725

 
 


 
 
 
 
 
 
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200212/d59a4287/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.jpg
Type: image/jpeg
Size: 1630 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200212/d59a4287/attachment.jpg>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image002.jpg
Type: image/jpeg
Size: 2622 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200212/d59a4287/attachment-0001.jpg>
