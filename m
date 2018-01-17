From: =?UTF-8?Q?Fran=C3=A7ois_LE_FOLL?= <francois.le-foll@jeumontds.com>
Date: Wed, 17 Jan 2018 23:47:34 +0100
Subject: [Buildroot] startx dev/fb0 permission
Message-ID: <CAJ5mzg-S0t4GsddTEErvwrPa1HrzknVk_69A8oXEUGTNxQeiTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
This is my first post here so don't hesitate to correct me concerning usage
here.

I come to you as this is my first attempt to use xorg on a ARM board
(wandboard quad Rev C1) within buildroot (I'm using buildroot 2017.02.8)

At the moment, all the build went smooth and board is running nice.
I can startx with user root but not with another user.

xorg.log is complaining about permission to access /dev/fb0

I read a lot here and there concerning:
   - xorg wrapper (needs_root_rights = no and allowed_users = anybody) but
no luck
   - user being part of specific group (I tried video and tty with no luck)

Can you please help me a bit to the right direction as I don't see which
permissino is missing

Additionnal question : while playing with users and group I can't find
usermod app wihtin buildroot (busybox). Am I missing something to get it ?

Thanks in advance
Snarf
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180117/d0bb5f01/attachment.html>
