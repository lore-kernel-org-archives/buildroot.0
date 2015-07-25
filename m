From: Adam Baxter <voltagex@voltagex.org>
Date: Fri, 24 Jul 2015 17:25:00 -0700
Subject: [Buildroot] Unable to login as root to new buildroot system
Message-ID: <CAChFQ9R=5anPgo9mboKxCkppsadQkSzC_WhpevWoarwgKVhLQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using the latest Git version of buildroot and the following config -
https://github.com/voltagex/serial-vm-buildroot

It builds and boots with qemu just fine, but no matter what combination of
getty/no getty/shell/root password I use, I can't login. Even with a blank
root password I'm told that the password is incorrect, and I can't work out
how to make it boot straight to a root prompt.

Can anyone help? The repo above should be able to be built with make
serial_defconfig, but if there's still hardcoded paths to a 'voltagex' or
'ubuntu' user you'll have to let me know how to remove them.

I've read http://lists.busybox.net/pipermail/buildroot/2012-July/056177.html
and similar threads found by googling "buildroot root login"

Regards,
Adam Baxter
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150724/06490608/attachment.html>
