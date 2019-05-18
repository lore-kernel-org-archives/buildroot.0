From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 18:25:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/cjson: security bump to version
 1.7.12
In-Reply-To: <20190517131436.12864-1-fontaine.fabrice@gmail.com>
References: <20190517131436.12864-1-fontaine.fabrice@gmail.com>
Message-ID: <20190518182551.113e41c3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 May 2019 15:14:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix infinite loop in cJSON_Minify (potential Denial of Service), see
> https://github.com/DaveGamble/cJSON/issues/354
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/cjson/cjson.hash | 2 +-
>  package/cjson/cjson.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
