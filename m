From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:54:58 +0100
Subject: [Buildroot] [PATCH 3/5 v5] core/pkg-infra: allow meson packages
 to specify custom build rules
In-Reply-To: <acd0d092fa0c62970c3c8b5e3cecedeb73dcc4aa.1545814334.git.yann.morin.1998@free.fr>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <acd0d092fa0c62970c3c8b5e3cecedeb73dcc4aa.1545814334.git.yann.morin.1998@free.fr>
Message-ID: <20181228115458.5aec06af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 09:52:28 +0100, Yann E. MORIN wrote:
> Some packages may want to build only specific targets, instead of the
> default.
> 
> So, allow them to provide FOO_NINJA_OPTS (not really options, but we
> just mimicked the naming we already have for autotools packages).
> 
> Update the manual accordingly.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>  docs/manual/adding-packages-meson.txt | 3 +++
>  package/pkg-meson.mk                  | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
