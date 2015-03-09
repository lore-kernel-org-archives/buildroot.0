From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 14:48:21 +0100
Subject: [Buildroot] [PATCH] fs/common: build host-xz when xz
 compression is used
In-Reply-To: <1425893653-9577-1-git-send-email-patrickdepinguin@gmail.com>
References: <1425893653-9577-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150309144821.335e985f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon,  9 Mar 2015 10:34:13 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> When a filesystem image is xz-compressed, the XZ variable is used to refer
> to the xz compression tool, but it is not necessarily available. Add a
> proper dependency to fix that.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  fs/common.mk | 1 +
>  1 file changed, 1 insertion(+)

I must say I don't quite understand why we have these options to
compress the resulting filesystem image.

But since we have them, I've applied your patch :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
