From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:37:38 +0200
Subject: [Buildroot] [PATCH 1/1] webkitgtk: Allow building with
 BR2_PACKAGE_WEBKITGTK_MULTIMEDIA disabled
In-Reply-To: <20170729131844.3502-1-aperez@igalia.com>
References: <20170729131844.3502-1-aperez@igalia.com>
Message-ID: <20170729153738.538fdd2b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 16:18:44 +0300, Adrian Perez de Castro wrote:
> Explicitly pass "-DENABLE_MEDIA_STREAM=OFF" to CMake, to workaround a
> missing feature dependency in the WebKitGTK+ build files.
> 
> Related upstream bug: https://bugs.webkit.org/show_bug.cgi?id=174940
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  package/webkitgtk/webkitgtk.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
