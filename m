From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 22:20:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/janus-gateway: enable parallel
 build
In-Reply-To: <20190926182319.8148-1-fontaine.fabrice@gmail.com>
References: <20190926182319.8148-1-fontaine.fabrice@gmail.com>
Message-ID: <20190927222051.6857a677@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Sep 2019 20:23:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Parallel build is fixed since version 0.4.4 and
> https://github.com/meetecho/janus-gateway/commit/1685a78e2cd7642f6246466c2e0d4e670fe6360b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/janus-gateway/janus-gateway.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
