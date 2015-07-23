From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:41:15 +0200
Subject: [Buildroot] [PATCH 1/1] qt/qt5base: Fix INCLUDE_PATH when no
 JPEG/PNG/GIF support
In-Reply-To: <1437655220-12168-1-git-send-email-corjon.j@ecagroup.com>
References: <1437655220-12168-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150723224115.7308e3ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On Thu, 23 Jul 2015 14:40:20 +0200, Julien Corjon wrote:
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  ...008-QtGui-force-image-dir-in-include_path.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch

What is this fixing? An autobuilder issue? If so, we want the
autobuilder reference in the commit log, like:

Fixes:

	http://autobuild.buildroot/...

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
