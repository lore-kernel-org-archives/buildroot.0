From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 21:43:07 +0100
Subject: [Buildroot] [PATCH/next 1/3] keepalived: remove popt dependency
In-Reply-To: <20181119180650.30516-1-fontaine.fabrice@gmail.com>
References: <20181119180650.30516-1-fontaine.fabrice@gmail.com>
Message-ID: <20181119214307.702479a0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Nov 2018 19:06:48 +0100, Fabrice Fontaine wrote:
> popt is not needed since version 1.3.1 and:
> https://github.com/acassen/keepalived/commit/3452517c4f2b69badabf19fc06cc56db49d37603
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/keepalived/Config.in     | 1 -
>  package/keepalived/keepalived.mk | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

Series applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
