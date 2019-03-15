From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 22:21:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.0.1
In-Reply-To: <20190315210709.2486-1-fontaine.fabrice@gmail.com>
References: <20190315210709.2486-1-fontaine.fabrice@gmail.com>
Message-ID: <20190315222146.0295e001@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Mar 2019 22:07:09 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove patch (not needed since:
> https://github.com/tornadoweb/tornado/commit/fa6a7ff6056fc8b139e51294095050f68076f850)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../python-tornado/0001-Disable-SSL-checks.patch   | 45 ----------------------
>  package/python-tornado/python-tornado.hash         |  4 +-
>  package/python-tornado/python-tornado.mk           |  4 +-
>  3 files changed, 4 insertions(+), 49 deletions(-)
>  delete mode 100644 package/python-tornado/0001-Disable-SSL-checks.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
