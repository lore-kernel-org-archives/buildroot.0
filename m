From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 16:15:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/postgresql: fix build with NLS
In-Reply-To: <20190420133551.31988-1-fontaine.fabrice@gmail.com>
References: <20190420133551.31988-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420161522.46289b64@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 20 Apr 2019 15:35:51 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/0d35378b8bdcfffb0cefd264c95ca3617034559b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/postgresql/postgresql.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
