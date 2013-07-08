From: Woody Wu <narkewoody@gmail.com>
Date: Mon, 8 Jul 2013 12:56:58 +0800
Subject: [Buildroot] How to rebuild root filesystem?
Message-ID: <20130708045657.GA29211@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 

Since things in my output/target got messed, hence I want to rebuild
everything in that directory and recreate the root filesystem image. How
can I ask buildroot to do it?

I knew that 'make clean' and 'make' will do it. But, my external
toolchain also get rebuilt, that can take very long time.

Thanks in advance.

-- 
I can't go back to yesterday - because I was a different person then
