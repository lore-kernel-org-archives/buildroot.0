From: Jay Aurabind <jay.aurabind@gmail.com>
Date: Mon, 25 Feb 2019 19:20:30 +0530
Subject: [Buildroot] Build error: kernel (local tarball) cannot find
 linux/version.h
Message-ID: <CAOsEZohGmBx4gfmhi7fuFJY8HGuk2ONkL8vTvyRs5bFy25R8+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am building buildroot 2018.11.2 with a custom kernel. I have the
local copy of the kernel tar'd sitting in the local filesystem, which
I git-archived from a specific commit. I did so since I do not want
buildroot to download the whole kernel history all over.

Corresponding error log: https://pastebin.com/yHYZ26HQ

The custom kernel I'm using is version 4.20, and during configuration,
I only have the option of selecting an older version string
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18

Is this the probable cause of the breakage ?


-- 

Thanks and Regards,
Jay
