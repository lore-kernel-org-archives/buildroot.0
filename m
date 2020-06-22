From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 21:11:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: add support for slice
 module
In-Reply-To: <20200621214227.1824098-1-fontaine.fabrice@gmail.com>
References: <20200621214227.1824098-1-fontaine.fabrice@gmail.com>
Message-ID: <20200622211143.638323e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Jun 2020 23:42:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> slice module is available since version 1.9.8 and
> https://github.com/nginx/nginx/commit/8ba626ccd71cbd704c7c69928d1d6fe58fd0445f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nginx/Config.in | 5 +++++
>  package/nginx/nginx.mk  | 1 +
>  2 files changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
