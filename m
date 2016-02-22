From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Feb 2016 14:50:58 -0300
Subject: [Buildroot] [PATCH] zmqpp: bump to version 4.1.2
In-Reply-To: <20160220001405.79f8eda5@free-electrons.com>
References: <1455800827-19066-1-git-send-email-gustavo@zacarias.com.ar>
 <20160220001405.79f8eda5@free-electrons.com>
Message-ID: <56CB4A82.6000506@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/02/16 20:14, Thomas Petazzoni wrote:

> This update doesn't seem to build here:
>
> install -m 755 ./build/libzmqpp.so.4 /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libzmqpp.so.4.1.2
> install -m 755 ./build/libzmqpp.a /home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libzmqpp.a
> install: cannot stat ?./build/libzmqpp.a?: No such file or directory
> Makefile:158: recipe for target 'install' failed
> make[2]: *** [install] Error 1
> package/pkg-generic.mk:234: recipe for target '/home/thomas/projets/buildroot/output/build/zmqpp-4.1.2/.stamp_staging_installed' failed
> make[1]: *** [/home/thomas/projets/buildroot/output/build/zmqpp-4.1.2/.stamp_staging_installed] Error 2
> Makefile:36: recipe for target '_all' failed
>
> Best regards,
>
> Thomas

Care to provide a defconfig for this?
I've tested the three possible combinations (static, shared, both) 
without issue.
Regards.
