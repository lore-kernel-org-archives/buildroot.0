From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:23:49 +0200
Subject: [Buildroot] [PATCH v2] package/ccache: bump to version 3.2.1
In-Reply-To: <1430051953-87326-1-git-send-email-kaszak@gmail.com>
References: <1430051953-87326-1-git-send-email-kaszak@gmail.com>
Message-ID: <20150426192349.694e2615@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Sun, 26 Apr 2015 14:39:13 +0200, Karoly Kasza wrote:
> Bump ccache from v.3.1.x to v.3.2.x.
> All functionality remained the same.
>  - Configure now accepts a parameter to use ccache's internal zlib.
>  - conf.c was introduced and some settings were moved from ccache.c,
>    with minor changes.
>  - The PATCH_CONFIGURATION hook was moved from POST_CONFIGURE to
>    POST_PATCH, as patching files should be done there, before calling
>    the configure script.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
> Changes v1 -> v2:
>   - added git commit message (Baruch)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
