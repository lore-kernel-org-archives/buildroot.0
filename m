From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 15:15:32 +0100
Subject: [Buildroot] [PATCH] rrdtool: bump to version 1.5.5
In-Reply-To: <1447248499-5233-1-git-send-email-gustavo@zacarias.com.ar>
References: <1447248499-5233-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20151111151532.7c45e47b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 11 Nov 2015 10:28:19 -0300, Gustavo Zacarias wrote:
> Drop the patches since this is a major bump and they're no longer
> relevant.
> 
> Introduce the new RRDTOOL_RRDGRAPH option, in previous versions the
> graphing functionality was bundled with the stats/database backend,
> however for newer versions this can be disabled.
> Since it's normally expected functionality the default is yes, however
> all of the buildroot rrd-using applications can work without this.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/rrdtool/0001-automake-compat.patch         | 18 -----------
>  ...0002-configure-dont-hardcode-include-dirs.patch | 26 ----------------
>  package/rrdtool/Config.in                          | 36 +++++++++++++++++-----
>  package/rrdtool/rrdtool.hash                       |  2 +-
>  package/rrdtool/rrdtool.mk                         | 36 ++++++++++++----------
>  5 files changed, 49 insertions(+), 69 deletions(-)
>  delete mode 100644 package/rrdtool/0001-automake-compat.patch
>  delete mode 100644 package/rrdtool/0002-configure-dont-hardcode-include-dirs.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
