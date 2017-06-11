From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:06:54 +0200
Subject: [Buildroot] [autobuild-run] autobuild-run: Add an exception for
 CS nios2 2017.02 with flann
In-Reply-To: <20170605171306.7941-1-romain.naour@gmail.com>
References: <20170605171306.7941-1-romain.naour@gmail.com>
Message-ID: <20170611180654.3e490735@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Jun 2017 19:13:06 +0200, Romain Naour wrote:
> This toolchain is affected by binutils PR19405 so use an autobuilder
> exception like for boost and qt5base (gui).
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=19405
> 
> Fixes:
> http://autobuild.buildroot.net/results/b13/b13377f03acccedc0441fb1e37e93f8e0b60da5e
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  scripts/autobuild-run | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to buildroot-test. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
