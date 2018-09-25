From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 23:14:34 +0200
Subject: [Buildroot] [PATCH v2 12/14] gst1-plugins-base: add missing
 license file hash
In-Reply-To: <20180925203618.23192-12-ps.report@gmx.net>
References: <20180925203618.23192-1-ps.report@gmx.net>
 <20180925203618.23192-12-ps.report@gmx.net>
Message-ID: <20180925231434.5e016ac4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Sep 2018 22:36:16 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
> index a98abdf38b..6ef34594a0 100644
> --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
> +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
> @@ -1,3 +1,3 @@
>  # From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.14.3.tar.xz.sha256sum
>  sha256 f0b319c36be0ffc2a00380c77ba269cdf04e2b39bbc49d30b641fc35aa0b7952 gst-plugins-base-1.14.3.tar.xz
> -sha256 78fb5977f177ab71cba77a4a127d29b93cb1ca5c25962204b31f183a20cf5c7a COPYING

I'm not sure why you're dropping this hash. The COPYING file still
exists, it still has the same hash, and you didn't mention it in your
commit log. So I've reverted this part of the change when applying.

> +sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING.LIB

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
