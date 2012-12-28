From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Dec 2012 20:50:48 +0100
Subject: [Buildroot] [PATCH 15/20] efl/expedite: bump to 1.7.4
In-Reply-To: <de051bb152fd3f20c9af502000de61e004925a95.1356723702.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356723702.git.thomas.petazzoni@free-electrons.com>
 <de051bb152fd3f20c9af502000de61e004925a95.1356723702.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20121228205048.38c0b205@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 28 Dec 2012 20:42:08 +0100, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/efl/expedite/expedite.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/efl/expedite/expedite.mk b/package/efl/expedite/expedite.mk
> index f25294e..4b245ec 100644
> --- a/package/efl/expedite/expedite.mk
> +++ b/package/efl/expedite/expedite.mk
> @@ -4,7 +4,7 @@
>  #
>  #############################################################
>  
> -EXPEDITE_VERSION = 1.7.3
> +EXPEDITE_VERSION = 1.7.4

Gaah, this should have been merged in PATCH 02/20. I'm fixing this and
pushing an updated branch in my public Git repo. I will not repost
immediately to the list, but instead wait for more reviews.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
