From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 23:16:33 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/util-linux: disable
 libsmartcols in no-MMU platforms
In-Reply-To: <1456078452-23865-1-git-send-email-romain.naour@gmail.com>
References: <1456078452-23865-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160225231633.7b318929@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 21 Feb 2016 19:14:11 +0100, Romain Naour wrote:
> As reported by Thomas Petazzoni [1], the libsmartcols library can't
> be used on no-MMU platform since fork() is used.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-February/153414.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/util-linux/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
