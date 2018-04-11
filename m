From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 11 Apr 2018 11:11:10 +0200
Subject: [Buildroot] [PATCH] chipmunk: new package
In-Reply-To: <20180411072911.17098-1-francois.perrad@gadz.org>
References: <20180411072911.17098-1-francois.perrad@gadz.org>
Message-ID: <20180411091110.GA24267@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Francois,

On Wed, Apr 11, 2018 at 09:29:11AM +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/chipmunk/Config.in     | 12 ++++++++++++
>  package/chipmunk/chipmunk.hash |  2 ++
>  package/chipmunk/chipmunk.mk   | 16 ++++++++++++++++
>  5 files changed, 32 insertions(+)
>  create mode 100644 package/chipmunk/Config.in
>  create mode 100644 package/chipmunk/chipmunk.hash
>  create mode 100644 package/chipmunk/chipmunk.mk
> 
> diff --git a/package/chipmunk/chipmunk.hash b/package/chipmunk/chipmunk.hash
> new file mode 100644
> index 000000000..53e13c38d
> --- /dev/null
> +++ b/package/chipmunk/chipmunk.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	6b6d8d5d910c4442fb9c8c4c46a178126d8c21d075cdb3ce439a7f8d8757b0ca  Chipmunk-7.0.2.tar.gz

Please add hash for LICENSE.txt as well.

Otherwise I think it looks good.

Best regards
Marcus Folkesson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180411/2d922064/attachment.asc>
