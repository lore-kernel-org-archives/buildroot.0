From: Facu Ramallo <facku24@gmail.com>
Date: Thu, 22 Oct 2020 15:53:00 -0300
Subject: [Buildroot] Minnowboard set up problem
Message-ID: <CALbLrU2J46KsUr8b+8U=0M24En3B+w9rwn3YJ6ve=COdZ7RATw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys!

I'm brandly new with buildroot. I'm trying to build a system for my
minnowboard. After a little research, I found out that the basic steps to
start are:

   - *make minnowboard_max_defconfig*
   - *make*
   - *dd if=sdcard.img of=my_sdcard bs=1M*

And I could finally start my linux distribution on my minnowboard. But,
then I used

   - *make menuconfig*

In order to enable the packages for openssh, I want to send some code
through  scp. But, after enable those packages, run

   - *make*
   - *dd if=sdcard.img of=my_sdcard bs=1M*

And the problem is that after my system boots, I don't read the
messages "*Wellcome
to Buildroot*" and "*buildroot login:*" anymore.

Can you tell me please, if I did something wrong?

Regards!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20201022/14a5b84c/attachment.html>
