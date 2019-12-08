From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:46:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix
 0003-remove-cpp-requirement.patch
In-Reply-To: <20191208213848.946171-1-aduskett@gmail.com>
References: <20191208213848.946171-1-aduskett@gmail.com>
Message-ID: <20191208224656.669ea9d1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Dec 2019 13:38:48 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> This patch was missing the following section:
> 
> @@ -1,4 +1,4 @@
> -project('glib', 'c', 'cpp',
> +project('glib', 'c',
>    version : '2.62.3',
>    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
>    meson_version : '>= 0.49.2',
> 
> As such, the package still depended on g++.
> 
> Update the patch to add the above section.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/libglib2/0003-remove-cpp-requirement.patch | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
