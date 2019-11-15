From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 23:35:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.26.2
In-Reply-To: <20191110162503.3529982-1-aperez@igalia.com>
References: <20191110162503.3529982-1-aperez@igalia.com>
Message-ID: <20191115233534.4e0b95f4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 10 Nov 2019 18:25:03 +0200
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a minor release which includes fixes for CVE-2019-8812 and
> CVE-2019-8814.
> 
> This release also fixes the build with WebDriver disabled, making patch
> "0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch" unneeded
> (and therefore removed). There is also a performance improvement for
> a regression related to fallback font selection, and a couple of small
> fixes. The full release notes are available at:
> 
>   https://wpewebkit.org/release/wpewebkit-2.26.2.html
> 
> The detailed security advisory can be found at:
> 
>   https://wpewebkit.org/security/WSA-2019-0006.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...uild-fails-with-ENABLE_WEBDRIVER-OFF.patch | 56 -------------------
>  package/wpewebkit/wpewebkit.hash              |  8 +--
>  package/wpewebkit/wpewebkit.mk                |  2 +-
>  3 files changed, 5 insertions(+), 61 deletions(-)
>  delete mode 100644 package/wpewebkit/0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
