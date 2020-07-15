From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 17:30:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/gvfs: add optional libfuse3
 dependency
In-Reply-To: <20200714173810.1245657-1-fontaine.fabrice@gmail.com>
References: <20200714173810.1245657-1-fontaine.fabrice@gmail.com>
Message-ID: <20200715173046.748c8b77@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Jul 2020 19:38:10 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libfuse3 is an optional dependency since version 1.41.1 and
> https://github.com/GNOME/gvfs/commit/7a0a06186b6fef07b8fce2360c04fd075fc84ed1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gvfs/gvfs.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
