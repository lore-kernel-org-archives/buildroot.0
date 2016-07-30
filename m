From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 21:52:50 +0200
Subject: [Buildroot] [PATCH 1/1] tinycbor: new package
In-Reply-To: <20160730164301.329de917@free-electrons.com>
References: <1469435859-25918-1-git-send-email-fabrice.fontaine@orange.com>
 <20160730164301.329de917@free-electrons.com>
Message-ID: <20160730215250.3596ce0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Jul 2016 16:43:01 +0200, Thomas Petazzoni wrote:

>  * On other architectures, a problem occurs when
>    output/target/usr/lib/libtinycbor.a is created as a directory, for
>    some reason:
> 
>    http://autobuild.buildroot.net/results/760/7605c301f460398c2435f6b73d6d07c7d1022e8c/build-end.log

I have committed a patch to fix this problem:
https://git.buildroot.org/buildroot/commit/?id=04c9be519de922cda3e20a00be2fad39b265d398.

The Blackfin problem remains to be solved, however.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
