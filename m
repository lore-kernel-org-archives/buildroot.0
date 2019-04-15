From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:40:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/cjson: security bump to version
 1.7.11
In-Reply-To: <20190414223529.3694-1-fontaine.fabrice@gmail.com>
References: <20190414223529.3694-1-fontaine.fabrice@gmail.com>
Message-ID: <20190415214056.4dafcf4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Apr 2019 00:35:29 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix a bug where cJSON_Minify could overflow it's buffer, both reading
> and writing: https://github.com/DaveGamble/cJSON/issues/338.
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
