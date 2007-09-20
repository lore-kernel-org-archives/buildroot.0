From: =?big5?B?V2VpY2hlbiBMZWUgKKf1q8K+XyAtIEFza2V5IC0gVFcp?= <weichen.lee@askey.com.tw>
Date: Thu, 20 Sep 2007 17:07:23 +0800
Subject: [Buildroot] Segmentation fault of running sudo
Message-ID: <9C1F4801E7902C4DB99BD17E121A0092024C3463B8@tpex07.askey.com.tw>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I use buildroot (svn r19828) to make the toolchain with the version below

kernel-headers 2.6.11
binutils 2.17
gcc 4.1.2
uClibc 0.9.29

There is no error during compiled time.
The sudo package is also compiled successfully.
The rootfs with program like busybox is work fine on the target board.
But when I run sudo, the output message is only show "Segmentation fault".
 Does anybodyelse encounter the same issue?


Best Regards
====================================
??????????

???? ?????

??? (Weichen Lee)

TEL:03-4759460  EXT:872
FAX:03-4759414
E-mail:weichen.lee at askey.com.tw
====================================
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot.config
Type: application/octet-stream
Size: 14522 bytes
Desc: buildroot.config
Url : http://busybox.net/lists/buildroot/attachments/20070920/e4bf0490/attachment-0001.obj 
