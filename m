From: glscantlen <glscantlen@gmail.com>
Date: Wed, 22 Jul 2015 09:56:13 -0700 (PDT)
Subject: [Buildroot] build libstdc++.so.6
In-Reply-To: <20150712002830.018e4bc0@free-electrons.com>
References: <1436634230228-105322.post@n4.nabble.com>
 <20150712002830.018e4bc0@free-electrons.com>
Message-ID: <1437584173498-106871.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for reply Thomas,

I have no good reason for using that version of their toolchain.
I did find an earlier version of eglibc binary that contained stdc++.
sysroot-linaro-eglibc-gcc4.9-2014.11-arm-linux-gnueabihf.tar.xz
But I have not tried that ver. yet.

My biggest  concern is having to rebuild any toolchain after a
' make clean' in Buildroot. I am sure there are other methods to
over come a toolchain rebuild, I just have not found one I like.

I am currently using a hack, copy from an Ubuntu build for arm.
And I only need the shared stdc++ for libmali.so which was
also a copy from the same Ubuntu build. I would prefer to build
libmali.so using the provided static stdc++ BUT! libmali source
contains proprietary code provided thru ARM commercial licence
and I have not yet resolved THAT issue. See this site:

http://malideveloper.arm.com/develop-for-mali/drivers/open-source-mali-gpus-linux-exadri2-and-x11-display-drivers/

Thanks again
Gary




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/build-libstdc-so-6-with-custom-toolchain-Linaro-4-9-tp105322p106871.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
