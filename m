From: Makis Tsimaras <tsigian@gmail.com>
Date: Sun, 14 Feb 2010 17:10:09 +0200
Subject: [Buildroot] which uid?
Message-ID: <e42c80a1002140710h66681551qb9f2f29f6dc82c75@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everybody.

I was doing a build for x86 target, and during the beginning (after i run
make),.. buildroot downloaded the linux kernel, extract it,.. and after
about 20-30 lines it stopped with an error like:

"Insecure dependency in open while running setuid at scripts/
headers_install.pl line 31"

I tried it a few times (as a normal user) and the same happened.

When i tried it as root, the building didn't stop and continued normally.

Am i gonna have any problem running the "make" command as root?


Thanks in advanced
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100214/0d9c8ce7/attachment.htm>
