From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 22:56:37 +0100
Subject: [Buildroot] [PATCH] xenomai: bump to 3.0.6
In-Reply-To: <20171204175909.21596-1-nolange79@gmail.com>
References: <20171204175909.21596-1-nolange79@gmail.com>
Message-ID: <20171206225637.26654f55@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Dec 2017 18:59:08 +0100, Norbert Lange wrote:
> From: Norbert Lange <norbert.lange@andritz.com>
> 
> this includes a fix to allow compilation with compilers
> defaulting to -fpie (gcc 6+)
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/xenomai/xenomai.hash | 2 +-
>  package/xenomai/xenomai.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master after adding some comment in the commit log about the
critical bug that has been fixed in this version, as reported by Romain.

Speaking of Xenomai, it would be really nice to have a test case for it
in our runtime test infrastructure, see support/testing/. If you're
interested feel free to contribute :-)

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
