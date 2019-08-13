From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Aug 2019 22:22:12 +0200
Subject: [Buildroot] [PATCH buildroot-test v3 0/3] allows to filter
 autobuild results by configuration symbols
In-Reply-To: <20190813131319.14860-1-victor.huesca@bootlin.com>
References: <20190813131319.14860-1-victor.huesca@bootlin.com>
Message-ID: <20190813222212.1b8bfb28@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Victor,

On Tue, 13 Aug 2019 15:13:16 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Victor Huesca (3):
>   web/db.inc.php: add support to test if the database supports a feature
>   web/funcs.inc.php: add support for filtering autobuild results by
>     configuration options
>   web/index.php: add support for configuration symbols via GET
> 
>  web/db.inc.php    | 28 ++++++++++++++++++++++++++--
>  web/funcs.inc.php | 40 ++++++++++++++++++++++++++++++++++------
>  web/index.php     |  3 +++
>  3 files changed, 63 insertions(+), 8 deletions(-)

Thanks, series applied to buildroot-test! You'll notice that on the
production server, it is quite slow when this new feature is used. I
guess it's going to be like this until we migrate to a newer version of
MariaDB that implements the "intersect" feature.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
