From: =?big5?B?V2VpY2hlbiBMZWUgKKf1q8K+XyAtIEFza2V5IC0gVFcp?= <weichen.lee@askey.com.tw>
Date: Thu, 20 Sep 2007 18:10:46 +0800
Subject: [Buildroot] Segmentation fault of running sudo
In-Reply-To: <867C0BFD0536F44B8184AD511C263A5222E76156F1@KFAEXMIPV1.sdcorp.global.sandisk.com>
References: <9C1F4801E7902C4DB99BD17E121A0092024C3463B8@tpex07.askey.com.tw>
	<867C0BFD0536F44B8184AD511C263A5222E76156F1@KFAEXMIPV1.sdcorp.global.sandisk.com>
Message-ID: <9C1F4801E7902C4DB99BD17E121A0092024C34641C@tpex07.askey.com.tw>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Yehuda,

Thanks.
I downgrade uClibc to 0.9.28.3.
It solved this problem.

Weichen

-----Original Message-----
From: Yehuda Hahn [mailto:Yehuda.Hahn at sandisk.com]
Sent: Thursday, September 20, 2007 5:51 PM
To: Weichen Lee (??? - Askey - TW)
Subject: RE: [Buildroot] Segmentation fault of running sudo

Weichen,

I had a similar problem with a number of packages, and solved it by downgrading uClibc to 0.9.28.3.

Cheers,

Yehuda


-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On Behalf Of Weichen Lee (??? - Askey - TW)
Sent: Thursday, September 20, 2007 11:07 AM
To: buildroot at uclibc.org
Subject: [Buildroot] Segmentation fault of running sudo

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
