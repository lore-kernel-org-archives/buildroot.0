From: Fathi Boudra <fboudra@gmail.com>
Date: Thu, 11 Sep 2008 17:08:26 +0200
Subject: [Buildroot] [patch] oprofile: bump version to 0.9.4 and make
	architecture independent
In-Reply-To: <1218539953.7930.14.camel@localhost>
References: <1216995456.18524.3.camel@localhost>
	<1218539953.7930.14.camel@localhost>
Message-ID: <6a2e33620809110808v73658fd3s8cfd986faac9d6c7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

it fails to build for me on powerpc:
/usr/bin/install: cannot stat
`/home/test/build-area/toolchain/buildroot/build_powerpc/oprofile-0.9.4/events/powerpc/events':
No such file or directory
/usr/bin/install: cannot stat
`/home/test/build-area/toolchain/buildroot/build_powerpc/oprofile-0.9.4/events/powerpc/unit_masks':
No such file or directory

make: ***
[/home/test/build-area/toolchain/buildroot/project_build_powerpc/myproject/root/usr/bin/oprofiled]
Error 1

cheers,

Fathi
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080911/d388974b/attachment.htm 
