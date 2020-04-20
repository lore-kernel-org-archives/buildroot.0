From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:53:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: manage
 BUILD_STATIC_LIBS
In-Reply-To: <20200419233009.386275-1-fontaine.fabrice@gmail.com>
References: <20200419233009.386275-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420075330.2062b68e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 01:30:09 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Use BUILD_STATIC_LIBS which has been added in version 3.1.4 with
> https://github.com/zhaojh329/libuhttpd/commit/4d0f435e0b96140f7b74239bbe2f76d5f7d782b7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libuhttpd/libuhttpd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
