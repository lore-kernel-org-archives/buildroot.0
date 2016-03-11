From: =?UTF-8?B?w5NzY2FyIEfDs21leiBGdWVudGU=?= <oscargomezf@gmail.com>
Date: Fri, 11 Mar 2016 13:59:41 +0100
Subject: [Buildroot] [rpi-firmware] I can't find the file /usr/sbin/vcdbg
	after compiling
Message-ID: <CALtfCQbACh2Odc7ACn6BDObdOCaaeLq-AnrE-RQdMNkE-=0zuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using the last release buildroot-2016.02 and I'm trying to test some
dtb files on my raspberry pi 2 (because It seems to be it doesn't work
well) so I'm trying to add the package to debug vcdbg:

Target package ---> Hardware handling  ---> Firmware ---> vcdbg

The compilation was successful but the file /usr/sbin/vcdbg doesn't exist
in the $TARGET_DIR

Can everyone help me? I don't know If It could be a bug.

Best regards.

Oscar Gomez Fuente
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160311/51f05661/attachment.html>
