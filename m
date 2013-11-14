From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 14 Nov 2013 09:11:39 -0500
Subject: [Buildroot] [pkg-luarocks infra V2 06/10] luarocks: new
	infrastructure
In-Reply-To: <1384436996-25525-7-git-send-email-francois.perrad@gadz.org>
References: <1384436996-25525-1-git-send-email-francois.perrad@gadz.org>
 <1384436996-25525-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <CANxTyt5rD4MrVtCZ0n=_UADZM2dcceytadkJnd40SrxjtNq9xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois,

On Thu, Nov 14, 2013 at 8:49 AM, Francois Perrad <fperrad@gmail.com> wrote:
> ---
>  Config.in               |    8 ++++++
>  Makefile                |    1 +
>  package/Makefile.in     |    1 +
>  package/pkg-luarocks.mk |   71 +++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 81 insertions(+)
>  create mode 100644 package/pkg-luarocks.mk
>
> diff --git a/Config.in b/Config.in
> index d87e0f0..bc5819c 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -207,6 +207,14 @@ config BR2_DEBIAN_MIRROR
>
>  endif
>
> +config BR2_LUAROCKS_MIRROR
> +       string "LuaRocks mirror"
> +       default "http://luarocks.org/repositories/rocks"
> +       help
> +         LuaRocks repository.
> +
> +         See, http://luarocks.org
> +
>  endmenu

Should be "See http://luarocks.org", no comma.

Danomi -
