From: gdbabu Krishnan <gdbabu.krishnan@gmail.com>
Date: Tue, 7 Jun 2016 19:35:26 +0530
Subject: [Buildroot] lirc event didn't forward
Message-ID: <CAG7w3ynQvczcSRsKMwABLTv+zRcURmbNHUJR=Sy2TCwOnMg-VQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i am working with buildroot for raspberry pi, i have enable the LIRC-TOOL
in build root.


i did successfully build, when i working with "irw" command for LIRC
working fine,

then i enable "uinput= True" in "lirc_options.conf" file under the
"/etc/lirc/" directory after this step i have restart the "S25lircd" service

after that i gave "irw" and press button  on remote nothing happen.

LIRCD does not forward the event to the "uinput" driver.

i don't know how to solve this problem could you help me please.


thank you
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160607/cb6e3738/attachment.html>
