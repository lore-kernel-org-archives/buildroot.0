From: Ron Eggler <ron.eggler@gmail.com>
Date: Mon, 13 Feb 2017 19:38:36 -0800
Subject: [Buildroot] gcc 5.2.0 not supported?
Message-ID: <e71f5729-1da1-eb07-67d1-4d99b795fd44@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've build a crosstoolchain for powerpc using crosstools-NG today and I 
wanted to use buildroot to compile a kernel for my system.
Now, turns out I'm getting:

 >>> toolchain-external Configuring Incorrect selection of gcc version: 
expected 4.3.x, got 5.2.0

on make and when I started Googling around, I found this thread 
http://lists.busybox.net/pipermail/buildroot/2015-July/133170.html from 
July 2015 that essentially says that gcc 5.2.0 is not supported.
Now I'm wondering if this is this still the case?

Also, before I had set the kernel headers to 4.3.x in menu config, I 
would get the same error but saying:

 >>> toolchain-external Configuring Incorrect selection of kernel 
headers: expected 2.6.x, got 4.3.x

Now as I've moved up the header version to match 4.3.x, I get the error 
pasted above. How can that be? How can I get my kernel built using the 
crosstools-NG toolchain?

Thanks,
Ron
