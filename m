From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 22:04:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtorrent: add Libs.Private to
 libtorrent.pc.in
In-Reply-To: <20191020183336.13455-1-fontaine.fabrice@gmail.com>
References: <20191020183336.13455-1-fontaine.fabrice@gmail.com>
Message-ID: <20191021220440.4eddade1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Oct 2019 20:33:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This will fix a static build failure with rtorrent
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/075598e1699c2ac20a4dfbcb5695bbb7343f9a86
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-libtorrent.pc.in-add-Libs.Private.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
