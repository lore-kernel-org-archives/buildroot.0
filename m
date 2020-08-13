From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:08:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-gunicorn: select
 python-setuptools
In-Reply-To: <20200810085920.447530-1-fontaine.fabrice@gmail.com>
References: <20200810085920.447530-1-fontaine.fabrice@gmail.com>
Message-ID: <20200813230832.7a78884b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Aug 2020 10:59:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=13111
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-gunicorn/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
