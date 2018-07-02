From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 2 Jul 2018 16:28:51 -0500
Subject: [Buildroot] [PATCH 50/50] support/scripts: don't draw most of
 busybox' dependencies
In-Reply-To: <d5b2e0eebf27fe994337e2c966f8ecf63849f3e1.1530565933.git.yann.morin.1998@free.fr>
References: <cover.1530565933.git.yann.morin.1998@free.fr>
 <d5b2e0eebf27fe994337e2c966f8ecf63849f3e1.1530565933.git.yann.morin.1998@free.fr>
Message-ID: <CANQCQpaMcRd4i1of-75oqkqgAQJ8wJ339F8Hnh9JeBXYF-pd-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, Jul 2, 2018 at 4:12 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Since most dependencies of busybox' are there to guarantee that busybox'
> does not install applets that are already provided by other packages,
> they are not really functional dependencies, and mostly clutter the
> dependency graph.
>
> Only the dependencies on libraries are interested, so that is all we
> keep.
>
> Even though that function is only called with pkg set to 'busybox', we
> still pass it as an argument, for symetry with the other functions that
> removes the dependencies of a package.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
