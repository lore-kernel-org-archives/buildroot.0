From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:24:03 +0200
Subject: [Buildroot] [PATCH 0/2] binutils: fix xtensa ld bug triggered
 by --gc-sections
In-Reply-To: <1431578340-11753-1-git-send-email-jcmvbkbc@gmail.com>
References: <1431578340-11753-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150516142403.6351e042@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Thu, 14 May 2015 07:38:58 +0300, Max Filippov wrote:
> Hi,
> 
> this series backports binutils fix for xtensa ld and reverts old workaround
> for this bug.
> 
> Max Filippov (2):
>   binutils: fix xtensa ld bug triggered by --gc-sections
>   Revert "kmod: disable --gc-sections ld option when building for
>     xtensa"

Both patches applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
