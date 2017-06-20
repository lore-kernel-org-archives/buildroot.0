From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:23:53 +0200
Subject: [Buildroot] [PATCH 00/14] toolchain-external: remove support
 for glibc before 2.17
In-Reply-To: <cover.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
Message-ID: <20170620222353.0030c78d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Jun 2017 06:32:45 +0300, Baruch Siach wrote:

> Baruch Siach (14):
>   docs/manual: update external toolchain advantages list
>   toolchain: remove CodeSourcery x86 toolchain
>   toolchain: remove CodeSourcery sh toolchain
>   package: remove CodeSourcery sh dependencies
>   toolchain-external: update list of toolchains
>   docs/manual: drop mention of removed external toolchains
>   swupdate: don't link with librt
>   aiccu: don't link with librt
>   libv4l: don't link with librt
>   e2fsprogs: don't link with librt
>   liboping: no need to check for clock_gettime
>   openipmi: no need to check for clock_gettime
>   lirc-tools: no need to check for clock_gettime
>   softether: no need to check for clock_gettime

Series applied, except the last patch, which is needed since softether
is also built on the host.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
