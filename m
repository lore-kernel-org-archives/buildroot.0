From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:30:49 +0200
Subject: [Buildroot] [PATCH] package/json-glib: set -Dintrospection=false
In-Reply-To: <20190715171801.409911-1-alex_y_xu@yahoo.ca>
References: <20190715171801.409911-1-alex_y_xu@yahoo.ca>
Message-ID: <20190717073049.42579415@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Jul 2019 13:18:01 -0400
"Alex Xu (Hello71)" <alex_y_xu@yahoo.ca> wrote:

> when it is true, the meson script auto-detects the host g-ir-scanner,
> which is not usable in a cross-compile environment.
> 
> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
> ---
>  package/json-glib/json-glib.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
