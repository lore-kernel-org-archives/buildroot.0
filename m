From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:55:19 +0100
Subject: [Buildroot] [PATCH v2 15/15] configs: nitrogen*: bump u-boot
 version to 2017.07
In-Reply-To: <20180105143947.26934-16-gary.bisson@boundarydevices.com>
References: <20180105143947.26934-1-gary.bisson@boundarydevices.com>
 <20180105143947.26934-16-gary.bisson@boundarydevices.com>
Message-ID: <20180107155519.33de28e7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 Jan 2018 15:39:47 +0100, Gary Bisson wrote:

>  board/boundarydevices/common/boot.cmd      | 155 +++++++++++++++++++++++++++++
>  board/boundarydevices/common/post-build.sh |   7 +-
>  board/boundarydevices/common/upgrade.cmd   | 154 ++++++++++++++++++++++++++++

Note: I start to find it annoying that we have 300+ lines of U-Boot
script code specific to the Boundary Devices board. I assume this stuff
is also duplicated in Yocto ? Shouldn't this be added to some common
repository ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
