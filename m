From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 13:02:56 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: update to version 2.18.1
In-Reply-To: <20171018230706.1133-1-aperez@igalia.com>
References: <20171018230706.1133-1-aperez@igalia.com>
Message-ID: <20171021130256.5fa12c5a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 Oct 2017 02:07:06 +0300, Adrian Perez de Castro wrote:
> This is a maintenance release of the current stable WebKitGTK+ version,
> which contains bugfixes (many of them related to rendering, plus one
> important fix for touch input) and many security fixes.
> 
> Release notes:
> 
>     https://webkitgtk.org/2017/10/18/webkitgtk2.18.1-released.html
> 
> Fixes CVE-2017-7081, CVE-2017-7087, CVE-2017-7089, CVE-2017-7090,
> CVE-2017-7091, CVE-2017-7092, CVE-2017-7093, CVE-2017-7094,
> CVE-2017-7095, CVE-2017-7096, CVE-2017-7098, CVE-2017-7099,
> CVE-2017-7100, CVE-2017-7102, CVE-2017-7104, CVE-2017-7107,
> CVE-2017-7109, CVE-2017-7111, CVE-2017-7117, CVE-2017-7120,
> CVE-2017-7142:
> 
>     https://webkitgtk.org/security/WSA-2017-0008.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/webkitgtk.hash | 8 ++++----
>  package/webkitgtk/webkitgtk.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

Since the update includes security fixes, I've changed the commit title
to "security bump to version ..." so that it's clear there are some
security fixes in there.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
