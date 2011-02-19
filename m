From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 19 Feb 2011 15:21:47 -0800
Subject: [Buildroot] Moving from 2.6.36.1 to 2.6.35.11 (or perhaps 2.6.35.9)
Message-ID: <AANLkTikMqQa2b8VALCFzCvhzhLGokgjjeu5jwWgbspv1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

My group desires to use the 2.6.35.11 kernel as it is listed as a longterm
stable kernel instead of the 2.6.36.1 buildroot currently supports <sigh>.

In looking at at buildroot, it appears that changine
buildroot-2010.11/.config BR2_DEFAULT_KERNEL_HEADERS *and* linux/Config.in
(3 places) would do it to change to an arbitrary kernel version.

Is this the correct procedure to change these two files? I can make it work
with 2.6.35.9, but it seems that kernel.org/pub/linux/kernel/v2.6/ contains
up to 2.6.35.9 but not 2.6.35.10 or 2.6.35.11 so 2.6.35.9 works but
2.6.35.11 fails.

Perhaps a FAQ entry regarding the changes necessary to move to various
kernels might be appropriate? I would offer to do it but I am (perhaps) two
days into using buildroot and I dont want to fubar the web site
instructions.

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110219/dbc18e7c/attachment.html>
