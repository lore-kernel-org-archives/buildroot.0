From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:11:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/civetweb: fix static build with
 openssl
In-Reply-To: <20190407163231.20134-1-fontaine.fabrice@gmail.com>
References: <20190407163231.20134-1-fontaine.fabrice@gmail.com>
Message-ID: <20190410191158.3b5ad608@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Apr 2019 18:32:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use pkg-config to retrieve openssl dependencies such as atomic
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b2e210bdefe84f4ec9cfda79a33d81788fb7e66c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/civetweb/civetweb.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Gaah, sorry, I'm only seeing this patch now, and in the mean time, I
have merged a similar patch from Giulio. Sorry about that :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
