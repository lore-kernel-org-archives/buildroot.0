From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 15:47:35 +0100
Subject: [Buildroot] [PATCH] package/glibc: remove mips r6 nan208 hook
In-Reply-To: <20171029114942.32635-1-romain.naour@gmail.com>
References: <20171029114942.32635-1-romain.naour@gmail.com>
Message-ID: <20171029154735.661ce151@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 12:49:42 +0100, Romain Naour wrote:
> This hook is not needed since glibc 2.23 [1] and can be safely removed.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=d5f2798a0ac9d5ad8ad7a506a2f840035135e2d2
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/glibc/glibc.mk | 30 ------------------------------
>  1 file changed, 30 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
