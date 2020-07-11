From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 16:00:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.28.3
In-Reply-To: <20200710115248.806492-1-aperez@igalia.com>
References: <20200710115248.806492-1-aperez@igalia.com>
Message-ID: <20200711160034.451123f1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jul 2020 14:52:48 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> This is a minor release which provides fixes for CVE-2020-9800,
> CVE-2020-9802, CVE-2020-9803, CVE-2020-9805, CVE-2020-9806,
> CVE-2020-9807, CVE-2020-9843, CVE-2020-9850, and CVE-2020-13753.
> 
> Updating from 2.28.2 also brings in the usual batch of fixes, including
> important improvements to threading in the media player. Full release
> notes can be found at:
> 
>   https://webkitgtk.org/2020/07/09/webkitgtk2.28.3-released.html
> 
> A detailed security advisory can be found at:
> 
>   https://webkitgtk.org/security/WSA-2020-0006.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/webkitgtk.hash | 8 ++++----
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
