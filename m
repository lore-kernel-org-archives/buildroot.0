From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:45:45 +0200
Subject: [Buildroot] [PATCH 1/4] package/nginx: add stream map option
In-Reply-To: <20200622193114.291257-1-fontaine.fabrice@gmail.com>
References: <20200622193114.291257-1-fontaine.fabrice@gmail.com>
Message-ID: <20200622224545.38c8515a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jun 2020 21:31:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> stream map module has been added in version 1.11.3 with
> https://github.com/nginx/nginx/commit/05db6ddfa1ca120c1c348cc750acded2a01b090a
> and is enabled by default, add an option to be able to disable it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nginx/Config.in | 6 ++++++
>  package/nginx/nginx.mk  | 1 +
>  2 files changed, 7 insertions(+)

All applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
