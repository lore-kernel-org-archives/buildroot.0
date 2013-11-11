From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 11 Nov 2013 17:10:22 +0100
Subject: [Buildroot] [PATCH 1/4] post-{build,
	images} hooks: export BUILD_DIR too
In-Reply-To: <69596da8e2ef280699e061b824ed41c00dee0426.1384182040.git.yann.morin.1998@free.fr>
References: <cover.1384182040.git.yann.morin.1998@free.fr>
 <69596da8e2ef280699e061b824ed41c00dee0426.1384182040.git.yann.morin.1998@free.fr>
Message-ID: <CAAXf6LVVKwOEzT0XVc3hL9q6kOYQRLa3XLz4+VYbzQs6x2gMMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 11, 2013 at 4:03 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Also export BUILD_DIR for post-{build,images} hooks, so they do have
> a place to store generated files.
>
> Note: this will be more einteresting for the instrumentation of steps,
> to come in a later patch.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  Makefile                         | 4 ++--
>  docs/manual/customize-rootfs.txt | 5 +++--
>  package/Makefile.in              | 6 ++++++
>  3 files changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
