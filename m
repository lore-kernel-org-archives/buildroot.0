From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Mar 2021 13:39:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/libupnp: disable samples
In-Reply-To: <20210330214213.759777-1-fontaine.fabrice@gmail.com>
References: <20210330214213.759777-1-fontaine.fabrice@gmail.com>
Message-ID: <20210331133923.6b7392bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 30 Mar 2021 23:42:13 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable samples which are built (but not installed) by default since at
> least version 1.6.0 and
> https://github.com/pupnp/pupnp/commit/89e7a40fcc5c51afacdc9d5f3d18f5338b2bc5e9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libupnp/libupnp.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
