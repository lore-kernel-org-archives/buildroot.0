From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 22:10:10 +0100
Subject: [Buildroot] [PATCH autobuild-run] autobuild-run: Add an
 exception for ctng toolchain armv5 with Guile package
In-Reply-To: <1478855706-5152-1-git-send-email-romain.naour@gmail.com>
References: <1478855706-5152-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161111221010.39bab403@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Nov 2016 10:15:06 +0100, Romain Naour wrote:
> Like for CS 2014.05 ARM toolchain, the ctng toolchain trigger an
> assembler error when Guile package is compiled with -Os.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=401c47e44b26e97db1c12cce0a42c62cfb72a9b9
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  scripts/autobuild-run | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks! However, it will take some time to get everyone to
update their copy of the autobuild-run script.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
