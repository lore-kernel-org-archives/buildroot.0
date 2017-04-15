From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Apr 2017 12:18:08 +0200
Subject: [Buildroot] [PATCH v5 4/4] Revert "package/sdl2: disable
 altivec built-in function for PowerPC"
In-Reply-To: <20170325215901.15044-4-romain.naour@gmail.com>
References: <20170325215901.15044-1-romain.naour@gmail.com>
 <20170325215901.15044-4-romain.naour@gmail.com>
Message-ID: <20170415121808.22302f26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Mar 2017 22:59:01 +0100, Romain Naour wrote:
> The bug discover while packaging supertux is now fixed by the previous
> patch but the issue can still be present in other C++11 package if
> -std=c++11 is used on PPC with Altivec vectorization.
> 
> This reverts commit d2903aaf1314b50a8a10ce937d2b33c5c42e463e.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/sdl2/sdl2.mk | 10 ----------
>  1 file changed, 10 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
