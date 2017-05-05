From: Mario Rugiero <mrugiero@gmail.com>
Date: Fri, 5 May 2017 14:24:00 -0300
Subject: [Buildroot] [PATCH v2] package: protobuf,
 python-protobuf: bump to v3.3.0
In-Reply-To: <CAKKQwLSKh5LijFRDNDXmocqgxtgSk1Gt_8vh8wnFDbCPbtdZJg@mail.gmail.com>
References: <20170503205945.7065-1-mrugiero@gmail.com>
 <20170504145610.39ba9d06@free-electrons.com>
 <CAKKQwLSKh5LijFRDNDXmocqgxtgSk1Gt_8vh8wnFDbCPbtdZJg@mail.gmail.com>
Message-ID: <CAKKQwLQWLytghCPeEWWjMsLw2vrcL-DumzWcevz2Dz+uwE0HGQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> You can reproduce this by using the following configuration:
>>
>> BR2_arm=y
>> BR2_TOOLCHAIN_EXTERNAL=y
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
>> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
>> BR2_TOOLCHAIN_EXTERNAL_URL="http://sources.buildroot.net/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-none-linux-gnueabi"
>> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>> BR2_TOOLCHAIN_EXTERNAL_CXX=y
>> BR2_INIT_NONE=y
>> # BR2_PACKAGE_BUSYBOX is not set
>> BR2_PACKAGE_PROTOBUF=y
>> # BR2_TARGET_ROOTFS_TAR is not set
>>
>> Best regards,
>>
>> Thomas Petazzoni
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
> Thanks, I'll look into it.
I fixed that particular issue in my local copy, but fails because
Atomic32 is not supported in that toolchain.
Do you know if there is any similar toolchain with such support?
Otherwise, how should I fix that?

Regards,
Mario.
