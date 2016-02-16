From: Leonardo Giordano <lgiordano@controlnet.com.ar>
Date: Tue, 16 Feb 2016 11:56:26 -0300
Subject: [Buildroot] Splashscreen issue
Message-ID: <CAFMv-cwu-X=w2XguBWidMJDVuzgtxo+b4EaVZT2akn5oO0LdGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
We were able to change the u-boot logo (although we are still having some
issues regarding color).

I also want to change the linux boot-up logo. Before trying a custom logo,
I enabled the option at Device Drivers->Graphic support->Bootup logo, and
then the 3 options there. I guess it should display the classic penguin
logo.

However,  nothing appears. Then, I added some printk() at:

   1.  fb_find_logo() at drivers/video/logo
   2. fb_prepare_logo() at drivers/video/fbdev/core/fbmem

But no message appears at dmesg.

Any tips?

BR,
Leonardo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160216/e80353ba/attachment.html>
