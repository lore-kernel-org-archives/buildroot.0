From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:33:22 +0200
Subject: [Buildroot] [PATCH 1/3] package/nginx: add stream realip option
In-Reply-To: <20200920081354.663762-1-fontaine.fabrice@gmail.com>
References: <20200920081354.663762-1-fontaine.fabrice@gmail.com>
Message-ID: <20200920153322.02c5329a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Sep 2020 10:13:52 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> stream realip is available since version 1.11.4 and
> https://github.com/nginx/nginx/commit/fe2774a9d689fa1bf201dd0e89449e3d9e4ad926
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nginx/Config.in | 5 +++++
>  package/nginx/nginx.mk  | 4 ++++
>  2 files changed, 9 insertions(+)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
