From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Wed, 20 Nov 2013 11:36:00 +0100
Subject: [Buildroot] Help to fix Microblaze issues in Buildroot
In-Reply-To: <20131120111027.472fe84b@skate>
References: <20131006185441.0d5c2397@skate>
 <CAM+bi4vGmKHRA3j0ua-dsOBzTuj-BPrM2+z3papeyfDjjazhgw@mail.gmail.com>
 <CAM+bi4t7Z4RWQ=6r=qOUOXKpqV76hRSogU0iBp12FKvN+fGviA@mail.gmail.com>
 <20131120111027.472fe84b@skate>
Message-ID: <CAM+bi4sKAyBrLjAKfBBkDMVDLReBHffqUCfdDvU61X1wErLfNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2013/11/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Therefore, the plan is, I believe:
>
>  (1) Merge Spenser's patches to add Microblaze internal toolchain
>  support.
>
>  (2) Remove the broken Microblaze external toolchains
>
>  (3) Hopefully, convince Xilinx to also provide pre-built external
>  toolchains that are up-to-date. This will have to be done by people
>  having contacts within Xilinx.
>

Now that I take the time to revisit Xilinx' website, I think maybe we're
doing something wrong...

Old Xilinx git repository,
http://git.xilinx.com/?p=microblaze-gnu.git;a=tree;f=binaries now redirect
to github: https://github.com/xilinx and seems to be quite up to date with
upstream gcc.

There seems to be also a later version of GNU Tools available at
http://www.xilinx.com/guest_resources/gnu/

   - GNU Tools for MicroBlaze (gcc 4.6.4, gdb 7.6.0, binutils 2.23.2,
   newlib 1.19, eglibc-2.18) -
mb_gnu_20131023.tar.gz<http://www.xilinx.com/guest_resources/member/mb_gnu/mb_gnu_20131023.tar.gz>

I don't know how up to date are these downloads, but it may be worth a try?
Although if we're going ahead with Spenser's patches maybe we can/(want
to?) avoid Xilinx altogether?

-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131120/21064ffe/attachment.html>
