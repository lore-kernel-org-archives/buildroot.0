From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:06:57 +0100
Subject: [Buildroot] [PATCH for-next] package/mesa3d-demos: bump to 8.4.0
In-Reply-To: <20180224111214.20071-1-romain.naour@gmail.com>
References: <20180224111214.20071-1-romain.naour@gmail.com>
Message-ID: <20180225220657.0c856147@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Feb 2018 12:12:14 +0100, Romain Naour wrote:
> Use the new upstream url.
> Added all hashes provided by upstream.
> Rebase patch on top of 8.4.0 and convert it to git formated patch.
> Add a comment above "MESA3D_DEMOS_AUTORECONF = YES"
> 
> See https://lists.freedesktop.org/archives/mesa-dev/2018-February/186542.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...demos-makes-opengl-an-optional-component.patch} | 56 ++++++++++++++--------
>  package/mesa3d-demos/mesa3d-demos.hash             |  7 ++-
>  package/mesa3d-demos/mesa3d-demos.mk               |  5 +-
>  3 files changed, 43 insertions(+), 25 deletions(-)
>  rename package/mesa3d-demos/{0001-demos-optional-gl.patch => 0001-demos-makes-opengl-an-optional-component.patch} (52%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
