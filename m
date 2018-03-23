From: Alejandro Ariel Fachini <alefachinic@gmail.com>
Date: Fri, 23 Mar 2018 16:15:32 -0300
Subject: [Buildroot] [At91Bootstrap3] Overriding dtb chosen arguments for
 kernel command line
Message-ID: <CAHnuF30hwkJAypbz6hLiGq=oVmZ2aYH0Yu6Vpp89xG69rNgXTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello:
I have been using at91bootstrap3 to directly load kernel, using dtb on
sam9x35ek, this kernel is mounting UBI RFS file.
Wel i need to mount another file JFFS2 and i want to change parameters in
Kernel Command Line.
I treid from inside at91bootstrap3-v3.8.6 terminal using make menuconfig
and selecting override kernel comand line but got error.
Also tried manually changing arguments in linux menu config and still get
the arguments inside DTB.
How can i do this? Thank you very much.
Note: I am not using U-Boot, using U-Boot is working ok.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180323/f5dc12f3/attachment.html>
