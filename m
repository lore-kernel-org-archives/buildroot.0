From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 23:17:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: fix build without
 WebDriver
In-Reply-To: <20191008082402.2449323-1-aperez@igalia.com>
References: <20191008082402.2449323-1-aperez@igalia.com>
Message-ID: <20191008231710.06cd0da7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Oct 2019 11:24:02 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Add "0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch", which is
> a slightly edited version of an upstream patch that fixes building WPE
> WebKit with ENABLE_WEBDRIVER=OFF.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...uild-fails-with-ENABLE_WEBDRIVER-OFF.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/wpewebkit/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
