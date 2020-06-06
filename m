From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 21:25:47 +0200
Subject: [Buildroot] [PATCH 1/2] package/upx: use HOST_CONFIGURE_OPTS
In-Reply-To: <20200606192033.2763135-1-fontaine.fabrice@gmail.com>
References: <20200606192033.2763135-1-fontaine.fabrice@gmail.com>
Message-ID: <20200606212547.53285a4e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  6 Jun 2020 21:20:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use HOST_CONFIGURE_OPTS to pass CPPFLAGS and LDFLAGS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/upx/upx.mk | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
