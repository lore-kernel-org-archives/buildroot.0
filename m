From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:53:27 +0200
Subject: [Buildroot] [PATCH 2/2] package/libuwsc: manage
 BUILD_STATIC_LIBS
In-Reply-To: <20200419232628.385881-2-fontaine.fabrice@gmail.com>
References: <20200419232628.385881-1-fontaine.fabrice@gmail.com>
 <20200419232628.385881-2-fontaine.fabrice@gmail.com>
Message-ID: <20200420075327.56b09aff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 01:26:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use BUILD_STATIC_LIBS added in version 3.3.5 with
> https://github.com/zhaojh329/libuwsc/commit/1759dfd7d9f65775dc0a27e85b8c8c482efbfd00
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libuwsc/libuwsc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
