From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 19:33:30 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain: add support for D language
In-Reply-To: <20191024181621.29349-2-eric.le.bihan.dev@free.fr>
References: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
 <20191024181621.29349-2-eric.le.bihan.dev@free.fr>
Message-ID: <20191025193330.7d079d47@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 24 Oct 2019 20:16:19 +0200
Eric Le Bihan <eric.le.bihan.dev@free.fr> wrote:

> Since version 9.1, GCC provides support for the D programming language [1].
> 
> So add an option to indicate the selected toolchain supports this
> language.
> 
> [1] https://dlang.org/
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  toolchain/Config.in | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
