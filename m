From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 May 2015 10:07:47 +0200
Subject: [Buildroot] [PATCH 11/13] board/boundarydevices: update
 6x_bootscript
In-Reply-To: <CAAMH-yt2G4rVszAoWRYQEQZ4rYzs_XC0jG1oEnLU1vjQYhxkng@mail.gmail.com>
References: <1432116744-25760-1-git-send-email-gary.bisson@boundarydevices.com>
 <1432116744-25760-12-git-send-email-gary.bisson@boundarydevices.com>
 <20150521190509.044f7661@free-electrons.com>
 <CAAMH-yt2G4rVszAoWRYQEQZ4rYzs_XC0jG1oEnLU1vjQYhxkng@mail.gmail.com>
Message-ID: <20150522100747.5acc94e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Fri, 22 May 2015 09:57:12 +0200, Gary Bisson wrote:

> Yes actually there is, I just removed the Yocto-specific part of this script:
> https://github.com/boundarydevices/u-boot-imx6/blob/staging/board/boundary/nitrogen6x/6x_bootscript-yocto-3.10.53.txt
> 
> Same goes for the other script/binary:
> https://github.com/boundarydevices/u-boot-imx6/blob/staging/board/boundary/nitrogen6x/6x_upgrade.txt
> 
> I'll make a V2 that adds BR2_PACKAGE_HOST_UBOOT_TOOLS to the
> nitrogen6x_defconfig and modify our post-build.sh to generate the
> binaries from the .txt files.

Excellent, thanks a lot!

Thoams
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
