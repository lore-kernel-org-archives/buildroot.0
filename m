From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:17:56 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webview: install missing
 plugins
In-Reply-To: <20191008090313.27361-1-b.bilas@grinn-global.com>
References: <20191008090313.27361-1-b.bilas@grinn-global.com>
Message-ID: <20191008231756.520581d3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Oct 2019 11:03:13 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> Fixes:
>   No WebView plug-in found!
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/qt5/qt5webview/qt5webview.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
