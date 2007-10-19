From: Steven Woody <narkewoody@gmail.com>
Date: Fri, 19 Oct 2007 09:15:25 +0800
Subject: [Buildroot] how can make buildroot work
Message-ID: <ed4892840710181815i6e42a7fbg97f4083f28a90590@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi forks,

i have not yet make buildroot work on my linux. i found following two
problems and need help from you experts.

1,  even after completed the `make source',  in the middle of `make'
process, buildroot still need to download many other packages.  it's
wired.  for example,  in the `make source' stage, it did not download
the linux-2.6.xx.tar.bz2  but do it when i run `make'.   i can not
understand.

2,  in the `make',  i failed because i don't have a `.config'  file
for the kernel.  but havn't buildroot provided any help to make a
baisc .config file for my 920 ARM target?  i don't believe it and
asked this list.  but i have not get a answer.


does this mean buildroot hard to use and understand?


thanks in advance.


-- 
woody

then sun rose thinly from the sea and the old man could see the other
boats, low on the water and well in toward the shore, spread out
across the current.
