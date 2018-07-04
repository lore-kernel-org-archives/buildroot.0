From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Jul 2018 22:00:45 +0200
Subject: [Buildroot] [PATCH 3/5] host zstd: additionally build binary
 and make selectable
In-Reply-To: <20180704070739.7259-4-thomas.de_schampheleire@nokia.com>
References: <20180704070739.7259-1-thomas.de_schampheleire@nokia.com>
 <20180704070739.7259-4-thomas.de_schampheleire@nokia.com>
Message-ID: <20180704220045.260129f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Jul 2018 09:07:37 +0200, Thomas De Schampheleire wrote:
> The zstd (de)compression tool may be used in post-image scripts to compress
> certain elements of the final image.
> 
> In order to allow that, make host-zstd selectable in the 'Host utilities'
> menu, and build the binary in addition to the library.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/Config.in.host      | 1 +
>  package/zstd/Config.in.host | 8 ++++++++
>  package/zstd/zstd.mk        | 4 ++++
>  3 files changed, 13 insertions(+)
>  create mode 100644 package/zstd/Config.in.host

I've tweaked a bit the commit title and applied.

Note that it could have been two separate commits, as the "and" in the
commit title suggests :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
