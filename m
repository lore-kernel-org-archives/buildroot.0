From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 20 Jun 2021 15:10:49 -0300
Subject: [Buildroot] [PATCH 1/1] configs: remove mesa3d kmsro-related
 options
In-Reply-To: <20210620083630.5813-1-bernd.kuhls@t-online.de>
References: <20210620083630.5813-1-bernd.kuhls@t-online.de>
Message-ID: <CAOMZO5AOie9mouxGY+P1KzJAALSe+TXK1=mZCvtm2EW14qb6YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Jun 20, 2021 at 5:37 AM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Removed kmsro-related options, these are now handled by the mesa3d
> build system:
> https://cgit.freedesktop.org/mesa/mesa/commit/?id=70813c1c13b99cb029c8fa3537163650bdd17b6d
>
> The removal commit of the buildroot option
> https://git.buildroot.net/buildroot/commit/package/mesa3d?id=d51736f47296e3681cdb610765c73424272d42db
>
> forgot to update the defconfigs, fixes
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1354066565
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks for the fix:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
