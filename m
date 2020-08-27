From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 00:11:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: drop unrecognized
 options
In-Reply-To: <20200827213657.257570-1-fontaine.fabrice@gmail.com>
References: <20200827213657.257570-1-fontaine.fabrice@gmail.com>
Message-ID: <20200828001128.2e8e5cb0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Aug 2020 23:36:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> demosaic packs have been removed since version 0.19.0 and
> https://github.com/LibRaw/LibRaw/commit/b85690eb4881d613dd48068ee82f98ac246690b8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libraw/libraw.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
