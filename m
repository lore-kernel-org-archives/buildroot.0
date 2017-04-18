From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Apr 2017 17:41:07 +0200
Subject: [Buildroot] [PATCH] trinity: needs __sync_val_compare_and_swap_4
In-Reply-To: <1492507590-2781-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1492507590-2781-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <20170418174107.0aa2c37b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Apr 2017 14:56:30 +0530, Rahul Bedarkar wrote:
> syscalls/futex.c uses sync_val_compare_and_swap(). So add dependency on
> BR2_TOOLCHAIN_HAS_SYNC_4.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/17f/17f7fe79242a40ff3e588748230de7bf2a010941
> 
> Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
> ---
>  package/trinity/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
