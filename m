From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 22:25:32 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Add upstream patch needed
 for builds with ENABLE_VIDEO=OFF
In-Reply-To: <20170729192705.19493-1-aperez@igalia.com>
References: <20170729192705.19493-1-aperez@igalia.com>
Message-ID: <20170729222532.11c137d9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 22:27:05 +0300, Adrian Perez de Castro wrote:
> This includes a slightly modified version of the patch for bug
> https://bugs.webkit.org/show_bug.cgi?id=174940
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...roken-build-when-ENABLE_VIDEO-is-disabled.patch | 207 +++++++++++++++++++++
>  1 file changed, 207 insertions(+)
>  create mode 100644 package/webkitgtk/0003-Fix-broken-build-when-ENABLE_VIDEO-is-disabled.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
