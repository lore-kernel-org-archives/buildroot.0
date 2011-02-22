From: Charles Krinke <charles.krinke@gmail.com>
Date: Mon, 21 Feb 2011 17:31:43 -0800
Subject: [Buildroot] rebuilding u-boot
Message-ID: <AANLkTim69LmQk8O7Evg9Tb4f9yOS6KRb7L_5VXCQTZbo@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I figured out how to rebuild uImage after reviewing the instructions. To
help others, it involves removing the file ".stamp_compiled" from the top of
the linux kernel tree in output/build/linux-xxx/

But, ... there is no corresponding ".stamp_compiled" in
output/build/u-boot-2010.06/

So, .... how does one go about rebuilding u-boot?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110221/d8735285/attachment.html>
