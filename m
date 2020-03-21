From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 16:37:04 +0100
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.15.4
In-Reply-To: <20200318204018.28606-1-ps.report@gmx.net>
References: <20200318204018.28606-1-ps.report@gmx.net>
Message-ID: <20200321163704.61296628@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Mar 2020 21:40:18 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1].
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2020-March/041332.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libinput/libinput.hash | 10 +++++-----
>  package/libinput/libinput.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index f39afa0457..eee0697151 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,8 +1,8 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2020-March/041288.html
> -md5  6fbea8d51d9194d7ba33f96d7c4cee56  libinput-1.15.3.tar.xz
> -sha1  101fd149b851c197323129efcdfe5c1c6c940b43  libinput-1.15.3.tar.xz
> -sha256  5b12427dd50489c2b41b04ae2ca54e31a112a33cb861f00ccd15a2ad7a88694d  libinput-1.15.3.tar.xz
> -sha512  6636fd618e2b9cfa5ee44701207dc98f2639adc53eb3ef135509d936fb19b2cedf5184eab58e887798d9cf8ee65f35bc9062f7e3630080bcbe45a90a8b631ef2  libinput-1.15.3.tar.xz
> +# From https://lists.freedesktop.org/archives/wayland-devel/2020-March/041332.html
> +md5  76c5cb1a55f5098ed353ae7d4e054c50  libinput-1.15.4.tar.xz
> +sha1  43740a5fec3f6d474906173cc01ff3d73d935d2f  libinput-1.15.4.tar.xz
> +sha256  9c8b6846d94e374ee4bdb32634e4ac4aa318afc31f9a58fcb545cd3095c745c1  libinput-1.15.4.tar.xz
> +sha512  : 4659818952dc729cd5bdb78ebe21edbbacbf8a66a592b13ba30f3bb4c4e264208ec94440a253cfa4edc8b2ef904954eecea6be0f8d63cf239e3858d3abb64a80  libinput-1.15.4.tar.xz

           ^^ this colon character here is a typo.

Applied after dropping the bogus colon character. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
