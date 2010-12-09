From: Jomas Nash <jomasnash@gmail.com>
Date: Thu, 9 Dec 2010 15:17:59 +0100
Subject: [Buildroot] problem with new package partimage
In-Reply-To: <AANLkTimc0c=FW=2Zv4jT9WWV7bc903J2VkOoZ0L9a+Af@mail.gmail.com>
References: <AANLkTimc0c=FW=2Zv4jT9WWV7bc903J2VkOoZ0L9a+Af@mail.gmail.com>
Message-ID: <AANLkTinKgMJibA8dC_n3e_KU2yRf6uOZ-90NAimmMasp@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Lionel Landwerlin advised me to run the program under gdb (thanks for the
advice).
So I tried this but i get an error in gdb.

1. I start gdb:    gdb partimage
2. The debugger starts and I type:   run

Then I see an error message in gdb:  /root/exec   /usr/bin/partimage : No
such file or directory

partimage is in /usr/bin  , So how can I debug my program?
Please help.


Kind regards,

Jomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101209/9c494f59/attachment.html>
