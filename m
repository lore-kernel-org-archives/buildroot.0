From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 14:21:04 +0200
Subject: [Buildroot] [PATCH] package/nginx-upload: bump to latest version
In-Reply-To: <20200910164842.1317307-1-hancock@sedsystems.ca>
References: <20200910164842.1317307-1-hancock@sedsystems.ca>
Message-ID: <20200912142104.7acbe353@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Sep 2020 10:48:42 -0600
Robert Hancock <hancock@sedsystems.ca> wrote:

> Update nginx-upload to a newer Git commit which adds upload support over
> HTTP2 as well as other fixes.
> 
> Remove a patch which is no longer required in the current version.
> 
> Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
> ---
>  ...ad-module-add-openssl-lib-dependency.patch | 56 -------------------
>  package/nginx-upload/nginx-upload.hash        |  2 +-
>  package/nginx-upload/nginx-upload.mk          |  2 +-
>  3 files changed, 2 insertions(+), 58 deletions(-)
>  delete mode 100644 package/nginx-upload/0001-nginx-upload-module-add-openssl-lib-dependency.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
