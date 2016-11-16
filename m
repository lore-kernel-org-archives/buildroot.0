From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Nov 2016 13:04:44 +0100
Subject: [Buildroot] [PATCH] autobuild-run: Add an exception for CS
 nios2 2016.05 with qt5base package (gui)
In-Reply-To: <1479248209-12976-1-git-send-email-romain.naour@gmail.com>
References: <1479248209-12976-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161116130444.109b7d9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 23:16:49 +0100, Romain Naour wrote:
> This toolchain is affected by binutils PR19405 and instead of adding a
> toolchain dependency on the GUI option of qt5base package and it's reverse
> dependencies, use an autobuilder exception.
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=19405
> 
> Fixes:
> http://autobuild.buildroot.net/results/620/6203c8ded2fcf6734b6f62b61e5a39464692340d
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  scripts/autobuild-run | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
