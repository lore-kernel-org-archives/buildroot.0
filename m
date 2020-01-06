From: Frederick Gotham <cauldwell.thomas@gmail.com>
Date: Mon, 6 Jan 2020 16:21:59 -0000 (UTC)
Subject: [Buildroot] Header is nine years old
Message-ID: <XnsAB3CA67D5979Efgotham@195.159.176.226>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



The following header file:

    #include <linux/list.h>

was added to the Github for the Linux kernel in May 2011. That was 9 years 
ago.

So on my Buildroot setup, I navigate to this directory:

    build/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux

And I check to see if "list.h" is in there. It's not there, and this is why I 
am unable to build the latest version of Barebox.

Anyone got any idea why that header file isn't in there?

Frederick
