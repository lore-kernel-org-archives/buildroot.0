From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 24 May 2012 07:11:02 -0700
Subject: [Buildroot] appreciate S49ntp advice
Message-ID: <CALo-6+ghsnURLrm8ALtkd-snN9WJT+G9=tRHiwzMQ2t8X2owUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have an MPC8321 target and am having a little trouble with one file.
We have a modified version of /etc/init.d/S49ntp in SVN and it is in
fs/skeleton/etc/init.d no problem.

But, ... when we do a make clean && make, it seems that the building
of the ntp package itself copies the original S49ntp into
output/target/etc/init.d/

The question becomes how to deal with this issue properly.

-- 
Charles Krinke
