From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Thu, 21 Aug 2014 10:37:52 +0200
Subject: [Buildroot] My own init. How?
Message-ID: <CAEzGmjCb2F_8vMuSkVYF5MNwKk-Qxt5Snx9pOJ-eozFpLz+Xuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I built a system successfully and used grub-bios-setup;
$ sudo ./output/host/usr/sbin/grub-bios-setup -b
./output/host/usr/lib/grub/i386-pc/boot.img -c ./output/images/grub.img -d
. /dev/sdX
I have disabled the 'Run a getty (login prompt) after boot.'

When my targetsystem thus has booted, I get a blank line.
Typing echoes to the display including pressing Enter giving a new blank
line.
That seems well, though I don't know what to expect to see from Busybox
init.

Now, I want to try my own init, a 'Hello, world'. Busybox FAQ says: '...
boot your device with an "init=" argument pointing to your hello world
program'.
How do I do that?

Thanks
Lennart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140821/d8383bc9/attachment.html>
