From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 2 Feb 2020 23:21:36 +0100
Subject: [Buildroot] [PATCH 21/32] package/r*: add license file hashes
In-Reply-To: <20200202194321.16321-22-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
 <20200202194321.16321-22-heiko.thiery@gmail.com>
Message-ID: <5fec229e-fcce-819a-a001-520a64d7af48@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Heiko,

On 02/02/20 20:43, Heiko Thiery wrote:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/rabbitmq-server/rabbitmq-server.hash | 18 +++++++++++++++++-
>  package/racehound/racehound.hash             |  1 +
>  package/ramsmp/ramsmp.hash                   |  3 ++-
>  package/ramspeed/ramspeed.hash               |  3 ++-
>  package/ranger/ranger.hash                   |  4 +++-
>  package/rapidxml/rapidxml.hash               |  3 ++-
>  package/raptor/raptor.hash                   |  3 ++-
>  package/ratpoison/ratpoison.hash             |  3 ++-
>  package/read-edid/read-edid.hash             |  3 ++-
>  package/rp-pppoe/rp-pppoe.hash               |  4 +++-
>  package/rsh-redone/rsh-redone.hash           |  4 +++-
>  package/rt-tests/rt-tests.hash               |  3 ++-
>  package/rtl8188eu/rtl8188eu.hash             |  3 ++-
>  package/rtl8821au/rtl8821au.hash             |  3 ++-
>  14 files changed, 45 insertions(+), 13 deletions(-)
> 
> diff --git a/package/rabbitmq-server/rabbitmq-server.hash b/package/rabbitmq-server/rabbitmq-server.hash
> index 3cd412dd0f..3c552820c1 100644
> --- a/package/rabbitmq-server/rabbitmq-server.hash
> +++ b/package/rabbitmq-server/rabbitmq-server.hash
> @@ -1,2 +1,18 @@
>  # Locally computed
> -sha256 395689bcf57fd48aed452fcd43ff9a992de40067d3ea5c44e14680d69db7b78e  rabbitmq-server-3.6.6.tar.xz
> +sha256  395689bcf57fd48aed452fcd43ff9a992de40067d3ea5c44e14680d69db7b78e  rabbitmq-server-3.6.6.tar.xz

Many lines in this patches are just whitespace changes, which is
generally not nice. But in this specific case you are moving from a
user-chosen number of spaces or tabs to the format produced by sha256
sum. IIRC that is pretty much constant, so I guess this could be adopted
a new standard.

For the above reason:
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
