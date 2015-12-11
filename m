From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Fri, 11 Dec 2015 16:37:43 +0530
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG not working fine
Message-ID: <CAKpDV8u01myqCx7ROq9C_7B9Wgomb8Assh_SmUeyCRAc3UkAXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am following steps 4 & 5 in this link :--
https://buildroot.org/downloads/manual/manual.html#_quick_guide_to_storing_your_project_specific_customizations

I am running following command :--- make busybox-update-config
BR2_PACKAGE_BUSYBOX_CONFIG=/home/dinesh/busybox/busybox.config

But busybox .config file doesn't go to right path set
"/home/dinesh/busybox/busybox.config".

Please suggets why is it going to location "package/busybox/busybox.config"
?

See the attached image.

Regards,

Dinesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151211/8ce2dca8/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_terminal_output.png
Type: image/png
Size: 10189 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151211/8ce2dca8/attachment.png>
