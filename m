From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 14:57:14 +0200
Subject: [Buildroot] [PATCH] package/ccache: bump version to 3.1.11
In-Reply-To: <1427629924-75317-1-git-send-email-kaszak@gmail.com>
References: <1427629924-75317-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150329145714.39bcdfa6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Sun, 29 Mar 2015 13:52:04 +0200, Karoly Kasza wrote:
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  package/ccache/ccache.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks. If you feel like it, sending a patch adding a hash
file would be good.

Also, there is still quite a lot of things to fix to get our ccache
support to a sane state. If you have some time, you could look at
http://patchwork.ozlabs.org/patch/287383/, especially the comments made
by Arnout, and try to improve the ccache support based on that.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
