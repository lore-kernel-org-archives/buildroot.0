From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 30 Jul 2019 11:09:09 +0200
Subject: [Buildroot] Multiple U-Boot boot scripts
Message-ID: <CAEyMn7Y=g-wqy_OOZCN0QpmzbE-yASsgKUUdc+njOXDrREhu+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,



Currently we use the buildroot infrastructure to generate the U-Boot boot
script and use the genimage support script to create the images. But now we
have to create an additional update image that should contain another
U-Boot boot script.



Is there an easy way to create this out of the box?



--

Heiko
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190730/3e2a33af/attachment.html>
